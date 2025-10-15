import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cookora/core/di/service_locator.dart';
import 'package:cookora/core/utils/async_state.dart';

import 'package:cookora/features/user/domain/entities/user_entity.dart';
import 'package:cookora/features/user/presentation/bloc/user_state.dart';
import 'package:cookora/features/user/presentation/bloc/user_bloc.dart';
import 'package:cookora/features/suggestion/presentation/bloc/suggestion_bloc.dart';
import 'package:cookora/features/suggestion/presentation/bloc/suggestion_event.dart';
import 'package:cookora/features/kitchen_log/presentation/bloc/kitchen_log_bloc.dart';
import 'package:cookora/features/kitchen_log/presentation/bloc/kitchen_log_event.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_bloc.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_event.dart';
import 'package:cookora/features/pantry/presentation/bloc/ingredient_management/ingredient_bloc.dart';
import 'package:cookora/features/pantry/presentation/bloc/ingredient_management/ingredient_event.dart';
import 'package:cookora/features/community/presentation/bloc/community_bloc.dart';
import 'package:cookora/features/community/presentation/bloc/community_event.dart';

// Widget này chịu trách nhiệm CUNG CẤP và KÍCH HOẠT các BLoC cho MainShell
class MainShellProvider extends StatelessWidget {
  final Widget child;
  const MainShellProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Cung cấp tất cả các BLoC singleton cần thiết cho các tab
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: locator<UserBloc>()),
        BlocProvider.value(value: locator<PantryBloc>()),
        BlocProvider.value(value: locator<SuggestionBloc>()),
        BlocProvider.value(value: locator<KitchenLogBloc>()),
        BlocProvider.value(value: locator<CommunityBloc>()),
        BlocProvider.value(value: locator<IngredientBloc>()),
      ],
      // Sử dụng BlocListener để lắng nghe UserBloc và kích hoạt các BLoC con
      child: BlocListener<UserBloc, UserState>(
        listenWhen: (p, c) => p.profileStatus != c.profileStatus,
        listener: (context, state) {
          final profileStatus = state.profileStatus;

          // KHI ĐĂNG NHẬP THÀNH CÔNG: UserBloc đã tải xong profile
          if (profileStatus is AsyncSuccess<UserEntity>) {
            final uid = profileStatus.data.uid;

            // Kích hoạt các stream cho các feature khác
            context.read<IngredientBloc>().add(const FetchAllIngredients());
            context.read<PantryBloc>().add(
              PantryEvent.subscribeToPantry(uid: uid),
            );
            context.read<SuggestionBloc>().add(
              SuggestionEvent.subscribeToSuggestions(uid: uid),
            );
            context.read<KitchenLogBloc>().add(
              KitchenLogEvent.subscribeToKitchenLog(uid: uid),
            );
            context.read<CommunityBloc>().add(
              CommunityEvent.subscribeToCommunityFeed(uid: uid),
            );
          }
          // KHI ĐĂNG XUẤT: User profile không còn ở trạng thái success nữa
          else if (profileStatus is! AsyncSuccess<UserEntity>) {
            // Gửi event dọn dẹp đến tất cả các BLoC con
            context.read<PantryBloc>().add(const PantryEvent.clearPantry());
            context.read<SuggestionBloc>().add(
              const SuggestionEvent.clearSuggestions(),
            );
            context.read<KitchenLogBloc>().add(
              const KitchenLogEvent.clearLog(),
            );
            context.read<CommunityBloc>().add(const CommunityEvent.clearFeed());
          }
        },
        child: child,
      ),
    );
  }
}
