// lib/features/pantry/presentation/widgets/entry/pantry_entry_details_dialog.dart
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_entry.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_lot.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_bloc.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_event.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_state.dart';
import 'package:cookora/features/pantry/presentation/widgets/ingredient/lot_form_dialog.dart';

class PantryEntryDetailsDialog extends StatelessWidget {
  final PantryEntry entry;

  const PantryEntryDetailsDialog({super.key, required this.entry});

  void _editLot(BuildContext context, PantryLot lot) async {
    final resultData = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (_) =>
          LotFormDialog(ingredient: entry.ingredient, initialLot: lot),
    );
    if (resultData != null && context.mounted) {
      context.read<PantryBloc>().add(
        UpdateLot(
          ingredientId: entry.ingredient.ingredientId,
          lotId: lot.id, // Cần truyền lotId để BLoC biết sửa lot nào
          lotData: resultData,
        ),
      );
    }
  }

  void _addLot(BuildContext context) async {
    final resultData = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (_) => LotFormDialog(ingredient: entry.ingredient),
    );
    if (resultData != null && context.mounted) {
      context.read<PantryBloc>().add(
        AddLot(ingredient: entry.ingredient, lotData: resultData),
      );
    }
  }

  void _deleteLot(BuildContext context, PantryLot lot) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Xác nhận xóa'),
        content: Text(
          'Bạn có chắc muốn xóa lô hàng số lượng ${lot.quantity} ${entry.unit} này không?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Hủy'),
          ),
          FilledButton(
            onPressed: () {
              context.read<PantryBloc>().add(
                DeleteLot(
                  ingredientId: entry.ingredient.ingredientId,
                  lotId: lot.id,
                ),
              );
              Navigator.of(dialogContext).pop();
            },
            child: const Text('Xóa'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PantryBloc, PantryState>(
      builder: (builderContext, state) {
        // ... (phần logic tìm currentEntry không đổi)
        PantryEntry? currentEntry;
        final status = state.entriesStatus;
        if (status is AsyncSuccess<List<PantryEntry>>) {
          currentEntry = status.data.firstWhereOrNull(
            (e) => e.ingredient.ingredientId == entry.ingredient.ingredientId,
          );
        }
        if (currentEntry == null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (Navigator.of(builderContext).canPop()) {
              Navigator.of(builderContext).pop();
            }
          });
          return const Dialog(child: SizedBox.shrink());
        }

        final theme = Theme.of(builderContext);
        // ... (phần UI của dialog không đổi)
        return AlertDialog(
          title: Text('Chi tiết: ${currentEntry.ingredient.name}'),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildListHeader(theme),
                const Divider(),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: currentEntry.lots.length,
                    itemBuilder: (context, index) {
                      final lot = currentEntry!.lots[index];
                      return _PantryLotTile(
                        lot: lot,
                        unit: currentEntry.unit,
                        onEdit: () => _editLot(builderContext, lot),
                        onDelete: () => _deleteLot(builderContext, lot),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => _addLot(builderContext),
              child: const Text('Thêm lô mới'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(builderContext).pop(),
              child: const Text('Đóng'),
            ),
          ],
        );
      },
    );
  }

  // ... (các widget helper _buildListHeader và _PantryLotTile không đổi)
  Widget _buildListHeader(ThemeData theme) {
    final textStyle = theme.textTheme.bodySmall?.copyWith(
      fontWeight: FontWeight.bold,
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text('Số lượng', style: textStyle)),
          Expanded(
            flex: 3,
            child: Text(
              'Hạn sử dụng',
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Sửa/Xóa',
              style: textStyle,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

class _PantryLotTile extends StatelessWidget {
  final PantryLot lot;
  final String unit;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _PantryLotTile({
    required this.lot,
    required this.unit,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final expiryDate = lot.expiryDate;
    String expiryText;
    Color expiryColor = colorScheme.onSurface;

    if (expiryDate != null) {
      final now = DateTime.now();
      final difference = expiryDate
          .difference(DateTime(now.year, now.month, now.day))
          .inDays;

      if (difference < 0) {
        expiryText = 'Đã hết hạn';
        expiryColor = colorScheme.error;
      } else if (difference == 0) {
        expiryText = 'Hôm nay';
        expiryColor = Colors.orangeAccent;
      } else if (difference <= 3) {
        expiryText = 'Còn $difference ngày';
        expiryColor = Colors.orangeAccent;
      } else {
        expiryText = DateFormat('dd/MM/yyyy').format(expiryDate);
      }
    } else {
      expiryText = 'Không có HSD';
      expiryColor = colorScheme.outline;
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              '${lot.quantity.toStringAsFixed(lot.quantity.truncateToDouble() == lot.quantity ? 0 : 1)} $unit',
              style: textTheme.bodyMedium,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              expiryText,
              style: textTheme.bodyMedium?.copyWith(color: expiryColor),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.edit_outlined, size: 20.sp),
                  onPressed: onEdit,
                  visualDensity: VisualDensity.compact,
                  tooltip: 'Sửa',
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete_outline,
                    size: 20.sp,
                    color: colorScheme.error,
                  ),
                  onPressed: onDelete,
                  visualDensity: VisualDensity.compact,
                  tooltip: 'Xóa',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
