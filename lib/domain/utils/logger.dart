import 'package:flutter/foundation.dart';

class Logger {
  static const String _resetColor = '\x1B[0m'; // Reset
  static const String _infoColor = '\x1B[32m'; // Green
  static const String _errorColor = '\x1B[31m'; // Red
  static const String _debugColor = '\x1B[34m'; // Blue
  static const String _warningColor = '\x1B[33m'; // Yellow

  static void debug({required dynamic message, StackTrace? stackTrace}) {
    if (kDebugMode) {
      var stackTrace = StackTrace.current;
      print(
          '$_debugColor [DEBUG] $message ${_getCallingMethodName(stackTrace, _debugColor, '[DEBUG]')}$_resetColor');
    }
  }

  static void info({required dynamic message}) {
    if (kDebugMode) {
      print('$_infoColor [INFO] $message$_resetColor');
    }
  }

  static void warning({required dynamic message, StackTrace? stackTrace}) {
    if (kDebugMode) {
      var stackTrace = StackTrace.current;
      print(
          '$_warningColor [WARNING] $message ${_getCallingMethodName(stackTrace, _warningColor, '[WARNING]')}$_resetColor');
    }
  }

  static void error({required dynamic message, StackTrace? stackTrace}) {
    if (kDebugMode) {
      print(
          '$_errorColor [ERROR] $message ${_getCallingMethodName(stackTrace, _errorColor, '[ERROR]')}$_resetColor');
    }
  }

  static String _getCallingMethodName(
      StackTrace? stackTrace, String color, String type) {
    if (stackTrace == null) {
      return '';
    }
    var stackTraceLines = stackTrace.toString().split('\n');
    if (stackTraceLines.isNotEmpty) {
      return '\n $_errorColor [ERROR] [\n${stackTraceLines.join('\n$_warningColor $type ')}\n]';
    }
    return '';
  }
}
