import 'package:cookora/core/widgets/async_state_builder.dart';
import 'package:cookora/core/widgets/glassmorphic_container.dart';
import 'package:cookora/features/user/domain/entities/user_entity.dart';
import 'package:cookora/features/user/presentation/bloc/user_bloc.dart';
import 'package:cookora/features/user/presentation/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'profile_widgets.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (p, c) =>
          p.profileStatus != c.profileStatus ||
          p.isUploadingAvatar != c.isUploadingAvatar,
      builder: (context, state) {
        return AsyncStateBuilder<UserEntity>(
          asyncState: state.profileStatus,
          successBuilder: (_, user) {
            return GlassmorphicContainer(
              borderRadius: 25.r,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
                child: Column(
                  children: [
                    UserInfo(user: user, state: state),
                    SizedBox(height: 24.h),
                    const UserStats(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
