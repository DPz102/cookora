import 'package:flutter/material.dart';

import 'package:cookora/core/utils/async_state.dart';

/// Widget này tương tự như AsyncStateBuilder nhưng trả về Sliver widget
/// Sử dụng trong CustomScrollView hoặc các widget yêu cầu Sliver
class AsyncSliverBuilder<T> extends StatelessWidget {
  final AsyncState<T> asyncState;
  final Widget Function(BuildContext context, T data) successBuilder;
  final Widget Function(BuildContext context)? loadingBuilder;
  final Widget Function(BuildContext context, String error)? errorBuilder;
  final Widget Function(BuildContext context)? initialBuilder;

  const AsyncSliverBuilder({
    super.key,
    required this.asyncState,
    required this.successBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.initialBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return switch (asyncState) {
      AsyncSuccess(data: final data) => successBuilder(context, data),
      AsyncLoading() =>
        loadingBuilder?.call(context) ??
            const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            ),
      AsyncFailure(error: final error) =>
        errorBuilder?.call(context, error) ??
            SliverToBoxAdapter(
              child: Center(child: Text("Đã có lỗi xảy ra:\n$error")),
            ),
      AsyncInitial() =>
        initialBuilder?.call(context) ??
            const SliverToBoxAdapter(child: SizedBox.shrink()),
      _ => const SliverToBoxAdapter(child: SizedBox.shrink()),
    };
  }
}
