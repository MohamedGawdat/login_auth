import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  static mainTheme() {
    return ThemeData(
      primarySwatch: AppColors.kPrimaryColor,
      backgroundColor: AppColors.mainBackGroundColor,
      scaffoldBackgroundColor: AppColors.mainBackGroundColor,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.appBarBG,
        elevation: 0,
        actionsIconTheme:
            IconThemeData(color: Colors.white, opacity: 1, size: 24),
        iconTheme:
            IconThemeData(color: AppColors.secAppColor, opacity: 1, size: 24),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.mainAppColor2,
      ),
      iconTheme: const IconThemeData(color: AppColors.mainAppColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 10,
        selectedIconTheme: const IconThemeData(
          color: AppColors.mainAppColor,
        ),
        selectedLabelStyle: GoogleFonts.cairo(
          textStyle: const TextStyle(
            color: AppColors.mainAppColor,
            fontWeight: FontWeight.w700,
            // fontSize: 15.sp,
          ),
        ).copyWith(
          color: AppColors.mainAppColor,
        ),
        selectedItemColor: AppColors.mainAppColor,
        unselectedLabelStyle: const TextStyle(
            fontSize: 15, height: 0.9, color: AppColors.mainAppColor),
        unselectedItemColor: AppColors.greyColorNavBar,
      ),
      tabBarTheme: const TabBarTheme(
        labelColor: AppColors.mainAppColor2,
        unselectedLabelColor: Colors.black,
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.mainAppColor2,
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),

      // primaryIconTheme: IconThemeData(color: AppColors.mainAppColor),
    );
  }
}
