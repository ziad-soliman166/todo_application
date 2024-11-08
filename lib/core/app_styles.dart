import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_application/core/colors_manager.dart';

class LightAppStyles {
  static TextStyle AppBarLight = GoogleFonts.poppins(
      fontSize: 22.sp, fontWeight: FontWeight.w700, color: ColorsManager.white);
  static TextStyle AppBarDark = GoogleFonts.poppins(
      fontSize: 22.sp,
      fontWeight: FontWeight.w700,
      color: ColorsManager.blackAccent);
  static TextStyle ThemeLabel = GoogleFonts.poppins(
      fontSize: 19.sp,
      fontWeight: FontWeight.w700,
      color: ColorsManager.blackAccent);
  static TextStyle ThemeLabelDark = GoogleFonts.poppins(
      fontSize: 19.sp, fontWeight: FontWeight.w700, color: ColorsManager.white);
  static TextStyle SelectedItemLabel = GoogleFonts.inter(
      fontSize: 15.sp, fontWeight: FontWeight.w400, color: ColorsManager.blue);
  static TextStyle bottomSheetTitle = GoogleFonts.inter(
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      color: ColorsManager.blackAccent);
  static TextStyle darkBottomSheetTitle = GoogleFonts.inter(
      fontSize: 18.sp, fontWeight: FontWeight.w700, color: ColorsManager.white);
  static TextStyle hint = GoogleFonts.inter(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: ColorsManager.hintColor);
  static TextStyle date = GoogleFonts.inter(
      fontSize: 16.sp, fontWeight: FontWeight.w400, color: Colors.black);
  static TextStyle darkDate = GoogleFonts.inter(
      fontSize: 16.sp, fontWeight: FontWeight.w400, color: Colors.white);
  static TextStyle calenderSelectedDate = GoogleFonts.inter(
      fontSize: 15.sp, fontWeight: FontWeight.w700, color: ColorsManager.blue);
  static TextStyle calenderSelectedDateDark = GoogleFonts.inter(
      fontSize: 15.sp, fontWeight: FontWeight.w700, color: ColorsManager.blue);
  static TextStyle calenderUnSelectedDate = GoogleFonts.inter(
      fontSize: 15.sp, fontWeight: FontWeight.w700, color: Colors.black);
  static TextStyle calenderUnSelectedDateDark = GoogleFonts.inter(
      fontSize: 15.sp, fontWeight: FontWeight.w700, color: Colors.white);
  static TextStyle todoDescription = GoogleFonts.roboto(
      fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black);
  static TextStyle todoDescriptionDark = GoogleFonts.roboto(
      fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white);
  static TextStyle todoTitle = GoogleFonts.poppins(
      fontSize: 18.sp, fontWeight: FontWeight.w400, color: Colors.blue);
}
