import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  /// Theme of the current context
  ThemeData get theme => Theme.of(this);

  /// Text theme of the current context
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Color scheme of the current context
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// MediaQuery data
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Padding (safe area)
  EdgeInsets get padding => MediaQuery.of(this).padding;

  /// ViewInsets (e.g. keyboard height)
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  /// ViewPadding (padding of the view)
  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;

  /// ScaffoldMessenger
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  /// Navigator
  NavigatorState get navigator => Navigator.of(this);
}
