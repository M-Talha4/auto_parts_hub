import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ColorScheme colorScheme(context) => Theme.of(context).colorScheme;

TextTheme txtTheme(context) => Theme.of(context).textTheme;

double mHeight(context) => MediaQuery.sizeOf(context).height;

double mWidth(context) => MediaQuery.sizeOf(context).width;

final String? appFontFamily = GoogleFonts.roboto().fontFamily;

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
