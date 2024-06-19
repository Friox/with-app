import 'package:flutter/material.dart';
import 'dart:ui';

class LayoutConstants {
  static const double containerPadding = 32.0;
  static const double containerCornerRadius = 16.0;
  static const double containerTitleOpacity = 0.5;
  static const double headerPaddingVertical = 16.0;
  static const double headerPaddingRight = containerPadding - 12;

  static const Color brandColor = Color(0xFFF1C40F);

  static const List<FontVariation> fontWeightThin = [FontVariation('wght', 200)];
  static const List<FontVariation> fontWeightRegular = [FontVariation('wght', 400)];
  static const List<FontVariation> fontWeightSemiBold = [FontVariation('wght', 600)];
  static const List<FontVariation> fontWeightBold = [FontVariation('wght', 800)];
  static const List<FontVariation> fontWeightBlack = [FontVariation('wght', 900)];
}