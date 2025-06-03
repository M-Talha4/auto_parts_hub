import 'dart:async';
import 'dart:io';

import '/domain/core/entities/user_entities/user_entity.dart';
import '/domain/core/interfaces/user_management_interface/user_management_repository.dart';
import '/domain/exceptions/network_exception.dart';
import '/domain/exceptions/time_out_exception.dart';
import '/infrastructure/dal/services/firebase_services/auth_services.dart';
import '/infrastructure/dal/services/firebase_services/chat_service.dart';
import '/infrastructure/dal/services/firebase_services/firestore_services.dart';

class UserManagementDao implements UserManagementRepository {
  final ChatService _chatService;
  final AuthServices _authServices;
  final FireStoreServices _fireStoreServices;
  UserManagementDao(
      this._chatService, this._authServices, this._fireStoreServices);

  @override
  Future<void> deleteUser(String userId) async {
    try {
      await _fireStoreServices.deleteUser(userId);
      await _chatService.deleteChat(
          userId, await _authServices.getAdminsCollection());
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<UserEntity>?> getAllUsers() async {
    try {
      return await _fireStoreServices.getUsersCollection();
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> checkAccountDeletion() async {
    try {
      await _authServices.getUserCollection();
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }
}
