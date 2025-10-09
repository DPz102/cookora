import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/snackbar_helper.dart';

import 'package:cookora/features/community/presentation/bloc/community_bloc.dart';
import 'package:cookora/features/community/presentation/bloc/community_event.dart';
import 'package:cookora/features/community/presentation/bloc/community_state.dart';

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
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      child: Container(
        padding: EdgeInsets.fromLTRB(
          16.w,
          16.h,
          16.w,
          MediaQuery.of(context).viewInsets.bottom + 16.h,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_imageFile == null)
                GestureDetector(
                  onTap: () => _pickImage(ImageSource.gallery),
                  child: Container(
                    height: 200.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: const Center(
                      child: Icon(Icons.add_a_photo, size: 50),
                    ),
                  ),
                )
              else
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.file(
                    _imageFile!,
                    height: 200.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              SizedBox(height: 16.h),
              TextField(
                controller: _captionController,
                decoration: const InputDecoration(labelText: 'Viết mô tả...'),
                maxLines: 3,
              ),
              SizedBox(height: 16.h),
              BlocBuilder<CommunityBloc, CommunityState>(
                builder: (context, state) {
                  final isLoading = state.createPostStatus is AsyncLoading;
                  return ElevatedButton(
                    onPressed: (_imageFile == null || isLoading)
                        ? null
                        : () {
                            context.read<CommunityBloc>().add(
                              CreatePost(
                                imageFile: _imageFile!,
                                caption: _captionController.text.trim(),
                              ),
                            );
                          },
                    child: Text(isLoading ? 'Đang đăng...' : 'Đăng bài'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
