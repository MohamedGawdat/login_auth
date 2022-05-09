import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyle {
  static TextStyle mainTextStyle = GoogleFonts.cairo(
    textStyle: TextStyle(
      color: AppColors.mainAppColor,
      fontWeight: FontWeight.w700,
      fontSize: 15.sp,
    ),
  );
  static TextStyle secTextStyle = GoogleFonts.cairo(
    textStyle: TextStyle(
      color: AppColors.secAppColor,
      fontWeight: FontWeight.w700,
      fontSize: 15.sp,
    ),
  );
  static TextStyle mainTextMainColor2 = GoogleFonts.cairo(
    textStyle: TextStyle(
      color: AppColors.mainAppColor2,
      fontWeight: FontWeight.w700,
      fontSize: 17.sp,
    ),
  );
  static TextStyle textFieldHintStyle = GoogleFonts.cairo(
    textStyle: TextStyle(
      color: AppColors.mainAppColor,
      fontWeight: FontWeight.w600,
      fontSize: 10.sp,
    ),
  );
  static TextStyle textFieldStyle = GoogleFonts.cairo(
    textStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 15.sp,
    ),
  );
  static TextStyle whiteButtons = GoogleFonts.cairo(
    textStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w800,
      fontSize: 18.sp,
    ),
  );
  static TextStyle blackButtons = GoogleFonts.cairo(
    textStyle: TextStyle(
      color: AppColors.darkBlue,
      fontWeight: FontWeight.w800,
      fontSize: 18.sp,
    ),
  );

  static TextStyle normalTextSemiBold = GoogleFonts.cairo(
      fontWeight: FontWeight.w600, fontSize: 16.sp, color: Colors.black);
  static TextStyle normalTextBold = GoogleFonts.cairo(
      fontWeight: FontWeight.w700, fontSize: 16.sp, color: Colors.black);
  static TextStyle titlesHeader = GoogleFonts.cairo(
      fontWeight: FontWeight.w700, fontSize: 20.sp, color: Colors.black);

  static TextStyle blueChatMsg = GoogleFonts.cairo(
      fontWeight: FontWeight.w500,
      fontSize: 15.sp,
      color: AppColors.secAppColor);
  static TextStyle whiteChatMsg = GoogleFonts.cairo(
    fontWeight: FontWeight.w500,
    fontSize: 15.sp,
    color: AppColors.whiteColor,
  );
  static TextStyle blueSemiBold1 = GoogleFonts.cairo(
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    color: AppColors.secAppColor,
  );
  static TextStyle blueBold = GoogleFonts.cairo(
    fontWeight: FontWeight.w700,
    fontSize: 18.sp,
    color: AppColors.secAppColor,
  );

  static TextStyle darkBlueSemiBold = GoogleFonts.cairo(
      fontWeight: FontWeight.w600, fontSize: 16.sp, color: AppColors.darkBlue);
  static TextStyle darkBlueLargeSizeSemiBold = GoogleFonts.cairo(
      fontWeight: FontWeight.w600, fontSize: 20.sp, color: AppColors.darkBlue);
  static TextStyle darkBlueTextBold = GoogleFonts.cairo(
      fontWeight: FontWeight.w700, fontSize: 16.sp, color: AppColors.darkBlue);

  static TextStyle smallGreyAppText = GoogleFonts.cairo(
    fontWeight: FontWeight.w600,
    fontSize: 12.sp,
    color: AppColors.greyColor,
  );
  static TextStyle mediumGreyAppText = GoogleFonts.cairo(
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
    color: AppColors.greyColorTextInContainer,
  );

  static TextStyle bigGreyText = GoogleFonts.cairo(
      fontWeight: FontWeight.w700, fontSize: 17.sp, color: AppColors.greyColor);
  static TextStyle normalGreyText = GoogleFonts.cairo(
      fontWeight: FontWeight.w700,
      fontSize: 16.sp,
      color: AppColors.greyColor777);

  static TextStyle smallWhiteTextBold = GoogleFonts.cairo(
      fontWeight: FontWeight.w600, fontSize: 10.sp, color: Colors.white);
  static TextStyle normalWhiteTextBold = GoogleFonts.cairo(
      fontWeight: FontWeight.w700, fontSize: 20.sp, color: Colors.white);
  static TextStyle normalWhite70TextBold = GoogleFonts.cairo(
      fontWeight: FontWeight.w600, fontSize: 20.sp, color: Colors.white70);
  static TextStyle normalSandTextBold = GoogleFonts.cairo(
      fontWeight: FontWeight.w600, fontSize: 20.sp, color: AppColors.sandColor);
  static TextStyle normalDeepOrangeTextBold = GoogleFonts.cairo(
      fontWeight: FontWeight.w600,
      fontSize: 12.sp,
      color: AppColors.deepOrange);
  static TextStyle normalRedTextBold = GoogleFonts.cairo(
      fontWeight: FontWeight.w700, fontSize: 15.sp, color: AppColors.red);
  static TextStyle normalGreenTextBold = GoogleFonts.cairo(
      fontWeight: FontWeight.w600,
      fontSize: 15.sp,
      color: AppColors.greenColor);
  static TextStyle appBarTitle = GoogleFonts.cairo(
      fontWeight: FontWeight.w800,
      fontSize: 15.sp,
      color: AppColors.secAppColor);
}
