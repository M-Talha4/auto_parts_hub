import 'package:flutter/foundation.dart';

class Logger {
  static const String _errorColor = '\x1B[31m'; // Red
  static const String _debugColor = '\x1B[34m'; // Blue
  static const String _infoColor = '\x1B[32m'; // Green
  static const String _warningColor = '\x1B[33m'; // Yellow
  static const String _resetColor = '\x1B[0m'; // Reset

  static void e(dynamic message) {
    if (kDebugMode) {
      var stackTrace = StackTrace.current;
      print(
          '$_errorColor[ERROR] [${_getCallingMethodName(stackTrace)}]:\n $message $_resetColor');
    }
  }

  static void d(dynamic message) {
    if (kDebugMode) {
      var stackTrace = StackTrace.current;
      print(
          '$_debugColor[DEBUG] [${_getCallingMethodName(stackTrace)}]:\n$message$_resetColor');
    }
  }

  static void i(dynamic message) {
    if (kDebugMode) {
      var stackTrace = StackTrace.current;
      print(
          '$_infoColor[INFO] [${_getCallingMethodName(stackTrace)}]:\n$message$_resetColor');
    }
  }

  static void w(dynamic message) {
    if (kDebugMode) {
      var stackTrace = StackTrace.current;
      print(
          '$_warningColor[WARNING] [${_getCallingMethodName(stackTrace)}]:\n$message$_resetColor');
    }
  }

  static String _getCallingMethodName(StackTrace stackTrace) {
    var stackTraceLines = stackTrace.toString().split('\n');
    if (stackTraceLines.length > 1) {
      var relevantLine = stackTraceLines[1].trim();
      return relevantLine;
    }
    return 'Unknown method';
  }
}
