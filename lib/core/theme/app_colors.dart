import 'package:flutter/material.dart';

abstract final class AppColors {
  // Primary
  static const Color primary = Color(0xFF5F60B9);
  static const Color primaryLight = Color(0xFFB1B2FC);
  static const Color primaryBackground = Color(0xFFF3F3FB);

  // Secondary
  static const Color secondary = Color(0xFF0F766E);
  static const Color secondaryLight = Color(0xFFCCFBF1);

  // Background
  static const Color background = Color(0xFFF8FAFC);
  static const Color surface = Color(0xFFFFFFFF);

  // Text
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textDisabled = Color(0xFF94A3B8);

  // Border
  static const Color border = Color(0xFFE2E8F0);
  static const Color divider = Color(0xFFE5E7EB);
  static const Color borderTextField = Color(0xFFB1B2FC);
  static const Color line = Color(0xFFEDEDED);


  // Status
  static const Color success = Color(0xFF16A34A);
  static const Color successLight = Color(0xFFDCFCE7);

  static const Color error = Color(0xFFDC2626);
  static const Color errorLight = Color(0xFFFEE2E2);

  static const Color warning = Color(0xFFD97706);
  static const Color warningLight = Color(0xFFFEF3C7);

  static const Color info = Color(0xFF0284C7);
  static const Color infoLight = Color(0xFFE0F2FE);

  // Common
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;
  static const Color lightBlue = Color(0xFFD3E3FF);
}
