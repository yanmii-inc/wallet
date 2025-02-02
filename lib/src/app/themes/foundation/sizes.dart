import 'package:flutter/material.dart';

//
// Constant for sizes to be used in the app with respecting 8 pixel rules
class AppSizes {
  //
  // Sizes that related with width
  static const w2 = 2.0;
  static const w4 = 4.0;
  static const w8 = 8.0;
  static const w12 = 12.0;
  static const w16 = 16.0;
  static const w20 = 20.0;
  static const w24 = 24.0;
  static const w28 = 28.0;
  static const w32 = 32.0;
  static const w36 = 36.0;
  static const w40 = 40.0;
  static const w48 = 48.0;
  static const w52 = 52.0;
  static const w56 = 56.0;
  static const w64 = 64.0;
  static const w72 = 72.0;
  static const w80 = 80.0;
  static const w96 = 96.0;

  //
  // Sizes that related with height
  static const h4 = 4.0;
  static const h8 = 8.0;
  static const h12 = 12.0;
  static const h16 = 16.0;
  static const h20 = 20.0;
  static const h24 = 24.0;
  static const h28 = 28.0;
  static const h32 = 32.0;
  static const h36 = 36.0;
  static const h40 = 40.0;
  static const h48 = 48.0;
  static const h52 = 52.0;
  static const h56 = 56.0;
  static const h64 = 64.0;
  static const h72 = 72.0;
  static const h80 = 80.0;
  static const h96 = 96.0;

  /// Sizes for custom width or height outside the 8 pixel rules
  static double w(double value) => value;

  static double h(double value) => value;
}

/// Constant for gaps to be used in the app with respecting 8 pixel rules
class Gap {
  /// Gaps that related with width
  static const w4 = SizedBox(width: AppSizes.w4);
  static const w8 = SizedBox(width: AppSizes.w8);
  static const w12 = SizedBox(width: AppSizes.w12);
  static const w16 = SizedBox(width: AppSizes.w16);
  static const w20 = SizedBox(width: AppSizes.w20);
  static const w24 = SizedBox(width: AppSizes.w24);
  static const w28 = SizedBox(width: AppSizes.w28);
  static const w32 = SizedBox(width: AppSizes.w32);
  static const w36 = SizedBox(width: AppSizes.w36);
  static const w40 = SizedBox(width: AppSizes.w40);
  static const w48 = SizedBox(width: AppSizes.w48);
  static const w52 = SizedBox(width: AppSizes.w52);
  static const w56 = SizedBox(width: AppSizes.w56);
  static const w64 = SizedBox(width: AppSizes.w64);
  static const w72 = SizedBox(width: AppSizes.w72);
  static const w80 = SizedBox(width: AppSizes.w80);

  /// Gaps that related with height
  static const h4 = SizedBox(height: AppSizes.h4);
  static const h8 = SizedBox(height: AppSizes.h8);
  static const h12 = SizedBox(height: AppSizes.h12);
  static const h16 = SizedBox(height: AppSizes.h16);
  static const h20 = SizedBox(height: AppSizes.h20);
  static const h24 = SizedBox(height: AppSizes.h24);
  static const h28 = SizedBox(height: AppSizes.h28);
  static const h32 = SizedBox(height: AppSizes.h32);
  static const h36 = SizedBox(height: AppSizes.h36);
  static const h40 = SizedBox(height: AppSizes.h40);
  static const h48 = SizedBox(height: AppSizes.h48);
  static const h52 = SizedBox(height: AppSizes.h52);
  static const h56 = SizedBox(height: AppSizes.h56);
  static const h64 = SizedBox(height: AppSizes.h64);
  static const h72 = SizedBox(height: AppSizes.h72);
  static const h80 = SizedBox(height: AppSizes.h80);

  /// Gaps for custom width or height outside the 8 pixel rules
  static SizedBox gapW(double value) => SizedBox(width: value);

  static SizedBox gapH(double value) => SizedBox(height: value);

  /// to get BuildContext.viewPadding.bottom
  /// used for give the empty space to fill the Bottom Outside SafeArea
  static dynamic bottomPadding(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;
    return gapH(bottomPadding);
  }
}

const horizontalPadding = EdgeInsets.symmetric(horizontal: AppSizes.w28);

const horizontalPaddingSmall = EdgeInsets.symmetric(horizontal: AppSizes.w12);
