import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cookora/core/widgets/glassmorphic_container.dart';
import 'package:cookora/core/widgets/gradient_background.dart';

class _NavigationItem {
  const _NavigationItem({
    required this.label,
    required this.iconPath,
    required this.selectedIconPath,
  });

  final String label;
  final String iconPath;
  final String selectedIconPath;
}

class MainShell extends StatefulWidget {
  const MainShell({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  static const List<_NavigationItem> _navItems = [
    _NavigationItem(
      label: 'Trang chủ',
      iconPath: 'assets/icons/home_unselected.svg',
      selectedIconPath: 'assets/icons/home_selected.svg',
    ),
    _NavigationItem(
      label: 'Kho',
      iconPath: 'assets/icons/pantry_unselected.svg',
      selectedIconPath: 'assets/icons/pantry_selected.svg',
    ),
    _NavigationItem(
      label: '',
      iconPath: 'assets/icons/scan.svg',
      selectedIconPath: 'assets/icons/scan.svg',
    ), // Nút Scan
    _NavigationItem(
      label: 'Cộng đồng',
      iconPath: 'assets/icons/community_unselected.svg',
      selectedIconPath: 'assets/icons/community_selected.svg',
    ),
    _NavigationItem(
      label: 'Tôi',
      iconPath: 'assets/icons/profile_unselected.svg',
      selectedIconPath: 'assets/icons/profile_selected.svg',
    ),
  ];

  void _onDestinationSelected(int index) {
    final bool isReSelecting = index == widget.navigationShell.currentIndex;
    widget.navigationShell.goBranch(index, initialLocation: isReSelecting);
  }

  Widget _buildNavItem({
    required BuildContext context,
    required int index,
    required _NavigationItem item,
    required int currentIndex,
    required Function(int) onTap,
  }) {
    final bool isSelected = index == currentIndex;
    final bool isScanButton = item.label.isEmpty;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final Color itemColor = isSelected
        ? colorScheme.primary
        : colorScheme.primary.withAlpha(153);

    // Nội dung bên trong của mỗi nút (icon và text nếu có)
    final Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          isSelected ? item.selectedIconPath : item.iconPath,
          // Kích thước icon lớn hơn nếu là nút Scan
          width: isScanButton ? 60.w : 24.w,
        ),
        if (!isScanButton) ...[
          SizedBox(height: 4.h),
          Text(
            item.label,
            style: textTheme.bodySmall?.copyWith(color: itemColor),
          ),
        ],
      ],
    );

    // Widget hoàn chỉnh có thể nhấn vào
    final Widget navItemWidget = GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: content,
    );
    return Expanded(child: navItemWidget);
  }

  @override
  Widget build(BuildContext context) {
    final int currentIndex = widget.navigationShell.currentIndex;

    return Scaffold(
      body: Stack(
        children: [
          const GradientBackground(),

          widget.navigationShell,

          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: GlassmorphicContainer(
                  borderRadius: 27.r,
                  blurSigma: 10.0,
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withAlpha(51),
                      Colors.white.withAlpha(26),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(
                    color: Colors.white.withAlpha(77),
                    width: 0.8,
                  ),
                  child: SizedBox(
                    height: 50.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: _navItems.asMap().entries.map((entry) {
                        final int index = entry.key;
                        final _NavigationItem item = entry.value;
                        return _buildNavItem(
                          context: context,
                          index: index,
                          item: item,
                          currentIndex: currentIndex,
                          onTap: _onDestinationSelected,
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
