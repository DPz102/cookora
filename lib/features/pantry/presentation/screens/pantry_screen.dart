// lib/features/pantry/presentation/screens/pantry_screen.dart
import 'package:cookora/features/pantry/presentation/screens/add_ingredient_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/snackbar_helper.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_entry.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_bloc.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_event.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_state.dart';
import 'package:cookora/features/pantry/presentation/widgets/common/pantry_filter_bar.dart';
import 'package:cookora/features/pantry/presentation/widgets/summary/pantry_summary_card.dart';
import 'package:cookora/features/pantry/presentation/widgets/grid/pantry_grid.dart';

class PantryScreen extends StatelessWidget {
  const PantryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 50.h),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AddIngredientScreen()),
            );
          },
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          shape: const CircleBorder(),
          elevation: 1,
          child: const Icon(Icons.add),
        ),
      ),
      body: BlocListener<PantryBloc, PantryState>(
        listenWhen: (p, c) => p.mutationStatus != c.mutationStatus,
        listener: (context, state) {
          final status = state.mutationStatus;
          if (status is AsyncSuccess) {
            context.showSnackBar(
              'Thao tác thành công!',
              type: SnackBarType.success,
            );
            context.read<PantryBloc>().add(const ResetMutationStatus());
          } else if (status is AsyncFailure) {
            context.showSnackBar(status.error, type: SnackBarType.error);
            context.read<PantryBloc>().add(const ResetMutationStatus());
          }
        },
        child: const _PantryView(),
      ),
    );
  }
}

// Chuyển thành StatefulWidget để quản lý trạng thái của bộ lọc
class _PantryView extends StatefulWidget {
  const _PantryView();

  @override
  State<_PantryView> createState() => _PantryViewState();
}

class _PantryViewState extends State<_PantryView> {
  // Biến state để lưu category đang được chọn
  String _selectedCategory = 'Tất cả';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'Kho nguyên liệu',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
            centerTitle: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          // Bọc PantrySummaryCard bằng BlocBuilder để nó nhận được dữ liệu entries
          SliverToBoxAdapter(
            child: BlocBuilder<PantryBloc, PantryState>(
              buildWhen: (p, c) => p.entriesStatus != c.entriesStatus,
              builder: (context, state) {
                if (state.entriesStatus is AsyncSuccess<List<PantryEntry>>) {
                  final entries =
                      (state.entriesStatus as AsyncSuccess<List<PantryEntry>>)
                          .data;
                  return PantrySummaryCard(entries: entries);
                }
                // Hiển thị card với giá trị 0 khi đang tải hoặc lỗi
                return const PantrySummaryCard(entries: []);
              },
            ),
          ),
          SliverPadding(padding: EdgeInsets.only(top: 15.h)),
          // Truyền category đang chọn và hàm callback để cập nhật state
          SliverToBoxAdapter(
            child: PantryFilterBar(
              selectedCategory: _selectedCategory,
              onSelected: (category) {
                setState(() {
                  _selectedCategory = category;
                });
              },
            ),
          ),
          PantryGrid(selectedCategory: _selectedCategory),
        ],
      ),
    );
  }
}
