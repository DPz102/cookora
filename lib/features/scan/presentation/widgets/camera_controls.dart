import 'package:flutter/material.dart';
import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/features/scan/domain/enums/scan_mode.dart';

class CameraControls extends StatelessWidget {
  final AsyncState scanStatus;
  final ScanMode currentMode;
  final void Function(ScanMode) onModeChanged;
  final VoidCallback onTakePicture;
  final VoidCallback onPickFromGallery;

  const CameraControls({
    super.key,
    required this.scanStatus,
    required this.currentMode,
    required this.onModeChanged,
    required this.onTakePicture,
    required this.onPickFromGallery,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [_buildHeader(), const Spacer(), _buildFooter()]),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _ModeButton(
                  mode: ScanMode.ingredient,
                  text: 'Nguyên liệu',
                  isSelected: currentMode == ScanMode.ingredient,
                  onTap: onModeChanged,
                ),
                const SizedBox(width: 8),
                _ModeButton(
                  mode: ScanMode.dish,
                  text: 'Món ăn',
                  isSelected: currentMode == ScanMode.dish,
                  onTap: onModeChanged,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 48),
      child: scanStatus is AsyncLoading
          ? const CircularProgressIndicator(color: Colors.white)
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  margin: const EdgeInsets.only(right: 24),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.photo_library_rounded,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: onPickFromGallery,
                  ),
                ),
                GestureDetector(
                  onTap: onTakePicture,
                  child: Container(
                    width: 84,
                    height: 84,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 2,
                          blurRadius: 8,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 76),
              ],
            ),
    );
  }
}

class _ModeButton extends StatelessWidget {
  final ScanMode mode;
  final String text;
  final bool isSelected;
  final void Function(ScanMode) onTap;

  const _ModeButton({
    required this.mode,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(mode),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
