import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'package:cookora/features/user/domain/entities/user_entity.dart';
import 'package:cookora/features/user/presentation/bloc/user_bloc.dart';
import 'package:cookora/features/user/presentation/bloc/user_event.dart';
import 'package:cookora/features/user/presentation/bloc/user_state.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key, required this.user, required this.state});
  final UserEntity user;
  final UserState state;

  void _changeAvatar(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null && context.mounted) {
      context.read<UserBloc>().add(UpdateAvatar(image));
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final imageUrl = user.photoURL.isNotEmpty
        ? user.photoURL
        : 'https://ui-avatars.com/api/?name=${user.username}&background=random&size=128';

    return Column(
      children: [
        SizedBox(
          height: 90.r,
          width: 90.r,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 45.r,
                backgroundImage: !state.isUploadingAvatar
                    ? NetworkImage(imageUrl)
                    : null,
                child: state.isUploadingAvatar
                    ? const CircularProgressIndicator()
                    : null,
              ),
              Positioned(
                right: -5.w,
                bottom: -5.h,
                child: Material(
                  color: colorScheme.primary,
                  shape: const CircleBorder(),
                  elevation: 2,
                  child: SizedBox(
                    width: 32.r,
                    height: 32.r,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 18.r,
                      icon: Icon(
                        Icons.edit_outlined,
                        color: colorScheme.onPrimary,
                      ),
                      onPressed: state.isUploadingAvatar
                          ? null
                          : () => _changeAvatar(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Text(user.username, style: textTheme.headlineSmall),
        SizedBox(height: 8.h),
        Text(
          user.email,
          style: textTheme.bodyLarge?.copyWith(
            color: colorScheme.inversePrimary,
          ),
        ),
      ],
    );
  }
}
