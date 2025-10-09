import 'package:flutter/material.dart';

import 'package:cookora/core/utils/async_state.dart';

// Widget này nhận vào một AsyncState và các hàm builder tương ứng
class AsyncStateBuilder<T> extends StatelessWidget {
  final AsyncState<T> asyncState;
  final Widget Function(BuildContext context, T data) successBuilder;
  final Widget Function(BuildContext context)? loadingBuilder;
  final Widget Function(BuildContext context, String error)? errorBuilder;
  final Widget Function(BuildContext context)? initialBuilder;

  const AsyncStateBuilder({
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
            const Center(child: CircularProgressIndicator()),

      AsyncFailure(error: final error) =>
        errorBuilder?.call(context, error) ??
            Center(child: Text("Đã có lỗi xảy ra:\n$error")),

      AsyncInitial() =>
        initialBuilder?.call(context) ?? const SizedBox.shrink(),
      _ => SizedBox.shrink(),
    };
  }
}
