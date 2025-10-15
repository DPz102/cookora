// lib/features/pantry/presentation/widgets/entry/pantry_entry_details_dialog.dart
import 'package:collection/collection.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_entry.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_lot.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_bloc.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_event.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_state.dart';
import '../ingredient/lot_form_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:cookora/core/utils/async_state.dart';

class PantryEntryDetailsDialog extends StatelessWidget {
  final PantryEntry entry; // Giữ lại entry ban đầu để lấy ID
  final Ingredient ingredientInfo;

  const PantryEntryDetailsDialog({
    super.key,
    required this.entry,
    required this.ingredientInfo,
  });

  void _editLot(BuildContext context, PantryLot lot) async {
    final result = await showDialog<PantryLot>(
      context: context,
      builder: (_) =>
          LotFormDialog(ingredient: ingredientInfo, initialLot: lot),
    );
    if (result != null && context.mounted) {
      context.read<PantryBloc>().add(UpdateLot(lot: result));
    }
  }

  void _addLot(BuildContext context) async {
    final result = await showDialog<PantryLot>(
      context: context,
      builder: (_) => LotFormDialog(ingredient: ingredientInfo),
    );
    if (result != null && context.mounted) {
      context.read<PantryBloc>().add(AddLot(lot: result));
    }
  }

  void _deleteLot(BuildContext context, PantryLot lot) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Xác nhận xóa'),
        content: Text(
          'Bạn có chắc muốn xóa lô hàng số lượng ${lot.currentQuantity}${lot.unit} này không?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Hủy'),
          ),
          FilledButton(
            onPressed: () {
              context.read<PantryBloc>().add(
                DeleteLot(ingredientId: lot.ingredientId, lotId: lot.id),
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
    // Bọc toàn bộ dialog bằng BlocBuilder để nó tự cập nhật khi state thay đổi
    return BlocBuilder<PantryBloc, PantryState>(
      builder: (builderContext, state) {
        PantryEntry? currentEntry;
        final status = state.entriesStatus;

        // Tìm kiếm entry mới nhất trong state của BLoC
        if (status is AsyncSuccess<List<PantryEntry>>) {
          currentEntry = status.data.firstWhereOrNull(
            (e) => e.ingredientId == entry.ingredientId,
          );
        }

        // Nếu không tìm thấy entry (ví dụ đã bị xóa), tự động đóng dialog
        if (currentEntry == null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (Navigator.of(builderContext).canPop()) {
              Navigator.of(builderContext).pop();
            }
          });
          // Trả về một dialog trống trong khi chờ đóng
          return const Dialog(child: SizedBox.shrink());
        }

        final theme = Theme.of(builderContext);

        // Dựng giao diện dialog với dữ liệu `currentEntry` mới nhất
        return AlertDialog(
          title: Text('Chi tiết: ${ingredientInfo.name}'),
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
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _PantryLotTile({
    required this.lot,
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
              '${lot.currentQuantity.toStringAsFixed(lot.currentQuantity.truncateToDouble() == lot.currentQuantity ? 0 : 1)} ${lot.unit}',
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
