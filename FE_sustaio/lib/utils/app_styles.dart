import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static final TextStyle Heading1 = GoogleFonts.inter(
    fontSize: 35,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );
  static final TextStyle Heading2 = GoogleFonts.inter(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
  );
  static final TextStyle Heading3 = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );
  static final TextStyle Heading4 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
  );
  static final TextStyle Subtitle = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
  );
  static final TextStyle Label = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );
  static final TextStyle Body1 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );
  static final TextStyle Body2 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );
  static final TextStyle smallText = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );
  static const SystemUiOverlayStyle statusBarStyle = SystemUiOverlayStyle(
    statusBarColor: primaryColor1,
    statusBarIconBrightness: Brightness.light,
  );

  static const Color primaryColor1 = Color(0xFF00D986A);
  static const Color primaryColor2 = Color(0xFF098C13F);
  static const Color primaryColor3 = Color(0xFF0DCE8D6);
  static const Color secondaryColor1 = Color(0xFF0F8D8BE);
  static const Color secondaryColor2 = Color(0xFF0FFEDCA);
  static const Color secondaryColor3 = Color(0xFF0FFFAED);
  static const Color sematicColor1 = Color(0xFF0EA4643);
  static const Color sematicColor2 = Color(0xFF034CE6C);
  static const Color sematicColor3 = Color(0xFF01877F2);
  static const Color neutralColor1 = Color(0xFF01A1A1A);
  static const Color neutralColor2 = Color(0xFF0333333);
  static const Color neutralColor3 = Color(0xFF04D4D4D);
  static const Color neutralColor4 = Color(0xFF0666666);
  static const Color neutralColor5 = Color(0xFF0858585);
  static const Color neutralColor6 = Color(0xFF0A3A3A3);
  static const Color neutralColor7 = Color(0xFF0C2C2C2);
  static const Color neutralColor8 = Color(0xFF0E0E0E0);
  static const Color neutralColor9 = Color(0xFF0F2F2F2);
}
