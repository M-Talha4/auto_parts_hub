// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';
import '../../services/firebase_services/user_services.dart';
import '/domain/core/interfaces/splash_interface/splash_repository.dart';
import '../../../../domain/exceptions/network_exception.dart';
import '../../../../domain/exceptions/time_out_exception.dart';

class SplashDao implements SplashRepository {
  final UserServices _userServices;

  SplashDao(this._userServices);

  @override
  Future<void> getCurrentUser() async {
    try {
      await _userServices.getUserData();
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }
}
