// lib/features/pantry/presentation/screens/pantry_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/snackbar_helper.dart';

import 'package:cookora/features/pantry/presentation/bloc/pantry_bloc.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_event.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_state.dart';
import 'package:cookora/features/pantry/presentation/screens/add_ingredient_screen.dart';
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
        padding: EdgeInsets.only(bottom: 90.h), // Tăng padding để không bị che
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true, // Cho phép sheet cao hơn 50% màn hình
              backgroundColor: Colors.transparent,
              builder: (_) {
                // Cung cấp PantryBloc cho cây widget của bottom sheet
                return BlocProvider.value(
                  value: context.read<PantryBloc>(),
                  child: const AddIngredientScreen(),
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
      body: BlocListener<PantryBloc, PantryState>(
        // Chỉ lắng nghe sự thay đổi của mutationStatus để hiển thị SnackBar
        listenWhen: (p, c) => p.mutationStatus != c.mutationStatus,
        listener: (context, state) {
          final status = state.mutationStatus;
          if (status is AsyncSuccess) {
            context.showSnackBar(
              'Thao tác thành công!',
              type: SnackBarType.success,
            );
            // Sau khi hiển thị, reset lại trạng thái để không bị trigger lại
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

// _PantryView quản lý state nội bộ cho việc filter và search
class _PantryView extends StatefulWidget {
  const _PantryView();

  @override
  State<_PantryView> createState() => _PantryViewState();
}

class _PantryViewState extends State<_PantryView> {
  String _selectedCategory = 'Tất cả';
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Lắng nghe thay đổi của search field để rebuild UI
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
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
              pinned: true, // Ghim AppBar lại
            ),
            // Summary Card luôn hiển thị và nhận dữ liệu từ BLoC
            SliverToBoxAdapter(
              child: BlocBuilder<PantryBloc, PantryState>(
                buildWhen: (p, c) => p.entriesStatus != c.entriesStatus,
                builder: (context, state) {
                  final entries =
                      state.entriesStatus.whenOrNull(success: (data) => data) ??
                      [];
                  return PantrySummaryCard(
                    entries: entries,
                    searchController: _searchController,
                  );
                },
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(top: 24.h)),
            // Filter Bar
            SliverAppBar(
              primary: false,
              toolbarHeight: 40.h,
              pinned: true,
              backgroundColor: Colors.transparent,
              flexibleSpace: PantryFilterBar(
                selectedCategory: _selectedCategory,
                onSelected: (category) {
                  setState(() {
                    _selectedCategory = category;
                  });
                },
              ),
            ),
            // Grid hiển thị kết quả đã được lọc
            PantryGrid(
              selectedCategory: _selectedCategory,
              searchQuery: _searchController.text,
            ),
            SliverPadding(padding: EdgeInsets.only(bottom: 130.h)),
          ],
        ),
      ),
    );
  }
}
