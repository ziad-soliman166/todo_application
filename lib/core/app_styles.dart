import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_application/core/colors_manager.dart';

class LightAppStyles {
  static TextStyle AppBarLight = GoogleFonts.poppins(
      fontSize: 22, fontWeight: FontWeight.w700, color: ColorsManager.white);
  static TextStyle ThemeLabel =
      GoogleFonts.poppins(fontSize: 19, fontWeight: FontWeight.w700);
  static TextStyle SelectedThemeLabel = GoogleFonts.inter(
      fontSize: 15, fontWeight: FontWeight.w400, color: ColorsManager.blue);
}
