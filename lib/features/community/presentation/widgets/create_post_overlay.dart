import 'dart:io';
import 'dart:ui';

import 'package:cookora/core/di/service_locator.dart';
import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/snackbar_helper.dart';
import 'package:cookora/core/widgets/custom_network_image.dart';
import 'package:cookora/features/community/presentation/bloc/community_bloc.dart';
import 'package:cookora/features/community/presentation/bloc/community_event.dart';
import 'package:cookora/features/community/presentation/bloc/community_state.dart';
import 'package:cookora/features/user/domain/entities/user_entity.dart';
import 'package:cookora/features/user/presentation/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostOverlay extends StatefulWidget {
  const CreatePostOverlay({super.key});

  @override
  State<CreatePostOverlay> createState() => _CreatePostOverlayState();
}

class _CreatePostOverlayState extends State<CreatePostOverlay> {
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  final _captionController = TextEditingController();

  Future<void> _pickImage(ImageSource source) async {
    if (Navigator.canPop(context)) Navigator.pop(context);
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() => _imageFile = File(pickedFile.path));
    }
  }

  void _showImageSourceOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (builderContext) {
        final theme = Theme.of(builderContext);
        return Container(
          padding: EdgeInsets.only(bottom: 90.h),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface.withAlpha(200),
                ),
                child: Wrap(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.photo_library_outlined),
                      title: const Text('Chọn từ thư viện'),
                      onTap: () => _pickImage(ImageSource.gallery),
                    ),
                    ListTile(
                      leading: const Icon(Icons.camera_alt_outlined),
                      title: const Text('Chụp ảnh mới'),
                      onTap: () => _pickImage(ImageSource.camera),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final UserEntity? user = locator<UserBloc>().state.profileStatus.whenOrNull(
      success: (userProfile) => userProfile,
    );

    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: _captionController,
      builder: (context, value, child) {
        return BlocListener<CommunityBloc, CommunityState>(
          listener: (context, state) {
            final status = state.createPostStatus;
            if (status is AsyncSuccess) {
              context.showSnackBar(
                "Đăng bài thành công!",
                type: SnackBarType.success,
              );
              Navigator.of(context).pop();
            }
            if (status is AsyncFailure) {
              context.showSnackBar(
                'Lỗi: ${status.error}',
                type: SnackBarType.error,
              );
            }
          },
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                height: 0.8.sh,
                decoration: BoxDecoration(
                  color: colorScheme.surface.withAlpha(200),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                  ),
                ),
                child: Column(
                  children: [
                    _buildHeader(context, textTheme),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8.h),
                            _buildUserInfo(user, textTheme),
                            _buildActionToolbar(context),
                            _buildTextField(textTheme),
                            if (_imageFile != null) _buildImagePreview(),
                          ],
                        ),
                      ),
                    ),
                    _buildFooter(context, value),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, TextTheme textTheme) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 8.w, 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 48.w),
          Text('Bài viết mới', style: textTheme.headlineSmall),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo(UserEntity? user, TextTheme textTheme) {
    return Row(
      children: [
        CustomNetworkImage(
          imageUrl: user?.photoURL ?? '',
          height: 52.r,
          width: 52.r,
          borderRadius: BorderRadius.circular(26.r),
        ),
        SizedBox(width: 12.w),
        Text(
          user?.username ?? 'User',
          style: textTheme.titleLarge?.copyWith(fontSize: 22.sp),
        ),
      ],
    );
  }

  Widget _buildActionToolbar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.add_photo_alternate_outlined,
              size: 22.sp,
            ), // Thu nhỏ icon
            onPressed: _showImageSourceOptions,
          ),
          IconButton(
            icon: Icon(
              Icons.alternate_email_outlined,
              size: 22.sp,
            ), // Thu nhỏ icon
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.add_location_alt_outlined,
              size: 22.sp,
            ), // Thu nhỏ icon
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextTheme textTheme) {
    return TextField(
      controller: _captionController,
      style: textTheme.bodyLarge?.copyWith(fontSize: 18.sp),
      autofocus: true,
      maxLines: null,
      minLines: 1,
      keyboardType: TextInputType.multiline,
      decoration: const InputDecoration(
        hintText: 'Hôm nay có gì vui, chia sẻ ngay...',
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        filled: false,
        contentPadding: EdgeInsets.symmetric(vertical: 8.0),
      ),
    );
  }

  Widget _buildImagePreview() {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.file(_imageFile!, fit: BoxFit.cover),
          ),
          Positioned(
            top: 8.h,
            right: 8.w,
            child: GestureDetector(
              onTap: () => setState(() => _imageFile = null),
              child: CircleAvatar(
                radius: 16.r,
                backgroundColor: Colors.black.withAlpha(180),
                child: Icon(Icons.close, size: 18.sp, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context, TextEditingValue value) {
    final canPost = _imageFile != null || value.text.isNotEmpty;
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 90.h),
      child: BlocBuilder<CommunityBloc, CommunityState>(
        builder: (context, state) {
          final isLoading = state.createPostStatus is AsyncLoading;
          return SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: (canPost && !isLoading)
                  ? () {
                      context.read<CommunityBloc>().add(
                        CreatePost(
                          imageFile: _imageFile!,
                          caption: _captionController.text.trim(),
                        ),
                      );
                    }
                  : null,
              child: isLoading
                  ? SizedBox(
                      width: 24.r,
                      height: 24.r,
                      child: const CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Colors.white,
                      ),
                    )
                  : const Text('Đăng bài'),
            ),
          );
        },
      ),
    );
  }
}
