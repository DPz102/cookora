import 'package:cookora/core/themes/extensions/app_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppColors {
  // Blue
  static const Color blue0 = Color(0xFF011998);
  static const Color blue1 = Color(0xFF012AFE);
  static const Color blue2 = Color(0xFF677FFE);
  static const Color blue3 = Color(0xFFCCD4FF);

  // Gray
  static const Color gray0 = Color(0xFF202020);
  static const Color gray1 = Color(0xFF73787E);
  static const Color gray2 = Color(0xFFCACDD2);
  static const Color gray3 = Color(0xFFFFFFFF);

  // Green
  static const Color green0 = Color(0xFF839901);
  static const Color green1 = Color(0xFFDAFF01);
  static const Color green2 = Color(0xFFE9FF67);
  static const Color green3 = Color(0xFFF8FFCC);

  // Pink
  static const Color pink0 = Color(0xFF981691);
  static const Color pink1 = Color(0xFFFD24F2);
  static const Color pink2 = Color(0xFFFE7CF7);
  static const Color pink3 = Color(0xFFFFD3FC);

  // Red (Error)
  static const Color red0 = Color(0xFF8A1C1C);
  static const Color red1 = Color(0xFFEA4335); // error
  static const Color red2 = Color(0xFFFF9D95);
  static const Color red3 = Color(0xFFFFE8E6); // errorContainer

  // Orange (Warning)
  static const Color orange0 = Color(0xFF7A4D00);
  static const Color orange1 = Color(0xFFFFB020); // warning
  static const Color orange2 = Color(0xFFFFD28A);
  static const Color orange3 = Color(0xFFFFF1D6);

  // Cyan (Info)
  static const Color cyan0 = Color(0xFF005E6A);
  static const Color cyan1 = Color(0xFF00B2C8); // info
  static const Color cyan2 = Color(0xFF7ADBE8);
  static const Color cyan3 = Color(0xFFE3FAFF); // infoContainer
}

class AppTextStyles {
  // Headings (Unbounded)
  static TextStyle heading1 = TextStyle(
    fontFamily: 'Unbounded',
    fontWeight: FontWeight.w700,
    fontSize: 56.sp,
    height: 1.24,
  );
  static TextStyle heading2 = TextStyle(
    fontFamily: 'Unbounded',
    fontWeight: FontWeight.w700,
    fontSize: 40.sp,
    height: 1.24,
  );
  static TextStyle heading3 = TextStyle(
    fontFamily: 'Unbounded',
    fontWeight: FontWeight.w700,
    fontSize: 32.sp,
    height: 1.24,
  );
  static TextStyle heading4 = TextStyle(
    fontFamily: 'Unbounded',
    fontWeight: FontWeight.w700,
    fontSize: 24.sp,
    height: 1.24,
  );
  static TextStyle heading5 = TextStyle(
    fontFamily: 'Unbounded',
    fontWeight: FontWeight.w700,
    fontSize: 20.sp,
    height: 1.24,
  );

  // Buttons (Unbounded)
  static TextStyle button1 = TextStyle(
    fontFamily: 'Unbounded',
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    height: 1.5,
    letterSpacing: 0.2.sp,
  );
  static TextStyle button2 = TextStyle(
    fontFamily: 'Unbounded',
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    height: 2.0,
    letterSpacing: 0.3.sp,
  );
  static TextStyle button3 = TextStyle(
    fontFamily: 'Unbounded',
    fontWeight: FontWeight.w700,
    fontSize: 12.sp,
    height: 2.0,
    letterSpacing: 0.3.sp,
  );
  static TextStyle button4 = TextStyle(
    fontFamily: 'Unbounded',
    fontWeight: FontWeight.w300,
    fontSize: 8.sp,
    height: 1.25,
  );

  // Body (Space Grotesk & Unbounded)
  static TextStyle body1 = TextStyle(
    fontFamily: 'SpaceGrotesk',
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    height: 1.5,
  );
  static TextStyle body2 = TextStyle(
    fontFamily: 'SpaceGrotesk',
    fontWeight: FontWeight.w300,
    fontSize: 12.sp,
    height: 1.33,
  );
  static TextStyle body3 = TextStyle(
    fontFamily: 'SpaceGrotesk',
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
    height: 1.2,
  );
  static TextStyle body4 = TextStyle(
    fontFamily: 'Unbounded',
    fontWeight: FontWeight.w400,
    fontSize: 8.sp,
    height: 1.0,
  );
  static TextStyle body5 = TextStyle(
    fontFamily: 'SpaceGrotesk',
    fontWeight: FontWeight.w600,
    fontSize: 28.sp,
    height: 1.0,
    letterSpacing: 0.0,
  );
}

// 1) COLOR SCHEME (LIGHT)
const ColorScheme _lightScheme = ColorScheme(
  brightness: Brightness.light,

  // Brand
  primary: AppColors.blue1,
  onPrimary: AppColors.gray3,
  primaryContainer: AppColors.blue3,
  onPrimaryContainer: AppColors.blue2,

  // Secondary
  secondary: AppColors.pink2,
  onSecondary: AppColors.gray3,
  secondaryContainer: AppColors.pink3,
  onSecondaryContainer: AppColors.pink1,

  // Tertiary / Success
  tertiary: AppColors.green1,
  onTertiary: AppColors.gray3,
  tertiaryContainer: AppColors.green3,
  onTertiaryContainer: AppColors.green1,

  // Error
  error: AppColors.red1,
  onError: AppColors.gray3,

  // Surfaces / background
  surface: AppColors.gray3,
  onSurface: AppColors.gray0,

  // Strokes
  outline: AppColors.gray2,
  outlineVariant: Color(0xFFE5E7EB),

  // Misc
  shadow: Color(0x1F000000),
  scrim: Color(0x73000000),

  inverseSurface: AppColors.gray0,
  onInverseSurface: AppColors.gray3,
  inversePrimary: AppColors.gray1,
);

// 2) TEXT THEME
TextTheme _textTheme(ColorScheme s) {
  return TextTheme(
    // Hero / Display
    displayLarge: AppTextStyles.heading1.copyWith(color: s.onSurface),
    displayMedium: AppTextStyles.heading2.copyWith(color: s.onSurface),
    displaySmall: AppTextStyles.heading3.copyWith(color: s.onSurface),

    // Headline / Section
    headlineLarge: AppTextStyles.heading3.copyWith(color: s.onSurface),
    headlineMedium: AppTextStyles.heading4.copyWith(color: s.onSurface),
    headlineSmall: AppTextStyles.heading5.copyWith(color: s.onSurface),

    // Title (AppBar / Card / Tile)
    titleLarge: AppTextStyles.heading4.copyWith(color: s.onSurface),
    titleMedium: AppTextStyles.body4.copyWith(color: s.onSurface),
    titleSmall: AppTextStyles.body5.copyWith(color: s.onSurface),

    // Body
    bodyLarge: AppTextStyles.body1.copyWith(color: s.onSurface),
    bodyMedium: AppTextStyles.body2.copyWith(color: s.onSurface),
    bodySmall: AppTextStyles.body3.copyWith(color: s.onSurface),

    // Labels (buttons/chips)
    labelLarge: AppTextStyles.button1.copyWith(color: s.onSurface),
    labelMedium: AppTextStyles.button2.copyWith(color: s.onSurface),
    labelSmall: AppTextStyles.button3.copyWith(color: s.onSurface),
  );
}

// 3) THEME DATA (LIGHT)
class AppTheme {
  AppTheme._();

  static ThemeData light() {
    final s = _lightScheme;
    final t = _textTheme(s);

    return ThemeData(
      useMaterial3: true,
      colorScheme: s,
      scaffoldBackgroundColor: s.surface,
      textTheme: t,
      // Toàn app: body mặc định SpaceGrotesk; Heading set tại TextTheme.
      fontFamily: 'SpaceGrotesk',
      extensions: <ThemeExtension<dynamic>>[AppGradients.light(s)],

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: s.surface,
        surfaceTintColor: s.surface,
        foregroundColor: s.onSurface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: t.titleLarge,
        iconTheme: IconThemeData(color: s.onSurface),
      ),

      // ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: const WidgetStatePropertyAll(Size(52, 52)),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 16),
          ),
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.disabled)
                ? s.primaryContainer.withAlpha(128) // 0.5
                : s.primaryContainer,
          ),
          foregroundColor: WidgetStatePropertyAll(s.primary),
          textStyle: WidgetStatePropertyAll(t.labelLarge),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          elevation: const WidgetStatePropertyAll(0),
        ),
      ),

      // OutlinedButton
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          minimumSize: const WidgetStatePropertyAll(Size(52, 52)),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 16),
          ),
          side: WidgetStatePropertyAll(BorderSide(color: s.outline)),
          foregroundColor: WidgetStatePropertyAll(s.primary),
          textStyle: WidgetStatePropertyAll(
            t.labelLarge!.copyWith(color: s.primary),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),

      // TextButton
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(s.primary),
          textStyle: WidgetStatePropertyAll(
            t.labelMedium!.copyWith(color: s.primary),
          ),
          overlayColor: WidgetStatePropertyAll(s.primary.withAlpha(20)), // 0.08
        ),
      ),

      // Inputs
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: s.surface,
        hintStyle: t.bodyMedium?.copyWith(color: s.inversePrimary),
        labelStyle: t.bodyMedium?.copyWith(color: s.inversePrimary),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 15,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: s.inversePrimary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: s.inversePrimary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: s.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: s.error, width: 1.5),
        ),
      ),

      // Cards
      cardTheme: CardThemeData(
        color: s.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        surfaceTintColor: s.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: s.outlineVariant),
        ),
      ),

      // Chips
      chipTheme: ChipThemeData(
        backgroundColor: s.surface,
        selectedColor: s.primary,
        disabledColor: s.surface,
        labelStyle: t.bodySmall!,
        side: BorderSide.none,
        showCheckmark: false,
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.5.r),
        ),
      ),

      // Navigation Bar
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: s.surface,
        indicatorColor: s.primaryContainer, // Màu của vệt highlight khi chọn
        elevation: 0,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,

        // Tuỳ chỉnh icon
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: s.primary); // Icon được chọn
          }
          return IconThemeData(
            color: s.onSurface.withAlpha(153),
          ); // Icon chưa chọn
        }),

        // Tuỳ chỉnh text label
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return t.bodySmall?.copyWith(color: s.primary);
          }
          // Style của bạn cho label chưa được chọn
          return t.bodySmall;
        }),
      ),

      // Snackbar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: s.inverseSurface,
        contentTextStyle: t.bodyLarge?.copyWith(color: s.surface),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      dividerTheme: DividerThemeData(
        color: s.outlineVariant,
        thickness: 1,
        space: 1,
      ),

      splashFactory: InkSparkle.splashFactory,
    );
  }
}
