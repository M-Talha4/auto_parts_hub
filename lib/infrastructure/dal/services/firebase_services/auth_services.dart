import 'dart:async';
import '/infrastructure/dal/services/firebase_services/firestore_services.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/domain/const/const.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import '/domain/core/entities/user_entities/user_entity.dart';
import '/infrastructure/dal/models/user_models/user_model.dart';

class AuthServices extends GetxService {
  final FireStoreServices _fireStoreServices;
  AuthServices(this._fireStoreServices);
  final firebase_auth.FirebaseAuth _firebaseAuth =
      firebase_auth.FirebaseAuth.instance;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection(firebaseUsersCollection);
  CollectionReference adminCollection =
      FirebaseFirestore.instance.collection(firebaseAdminCollection);
  firebase_auth.UserCredential? userCredential;

// ----------------------------reset password ----------------------------------
  Future<void> resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      rethrow;
    }
  }

// ----------------------------logout password ----------------------------------
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
  }

// ----------------------------Login ----------------------------------
  Future<String> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .timeout(const Duration(seconds: 10));
      return userCredential!.user!.uid;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUserCollection() async {
    try {
      String userId = _firebaseAuth.currentUser?.uid ?? '';
      _fireStoreServices.loggedIn(userId);
      DocumentSnapshot doc = await userCollection.doc(userId).get();
      if (doc.exists) {
        return UserModel.fromJson(doc.data() as Map<String, dynamic>);
      }
      logout();
      throw 'User has been deleted by Admin!';
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getAdminCollection() async {
    try {
      String userId = _firebaseAuth.currentUser?.uid ?? '';
      DocumentSnapshot doc = await adminCollection.doc(userId).get();
      return UserModel.fromJson(doc.data() as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> getUsersCollection() async {
    try {
      QuerySnapshot querySnapshot = await userCollection.get();
      if (querySnapshot.docs.isEmpty) {
        return [];
      }
      return querySnapshot.docs
          .map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> getAdminsCollection() async {
    try {
      QuerySnapshot querySnapshot = await adminCollection.get();
      if (querySnapshot.docs.isEmpty) {
        return [];
      }
      return querySnapshot.docs
          .map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  // ---------------------------- Signup ----------------------------------
  Future<String> signUpWithEmailAndPassword(
      UserEntity user, String password) async {
    try {
      firebase_auth.UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: user.email, password: password)
          .timeout(
            const Duration(seconds: 10),
          );
      return userCredential.user!.uid;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createUserCollection(UserModel user) async {
    try {
      _fireStoreServices.loggedIn(user.userId);
      await userCollection.doc(user.userId).set(user.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createAdminCollection(UserModel user) async {
    try {
      await adminCollection.doc(user.userId).set(user.toJson());
    } catch (e) {
      rethrow;
    }
  }

  //----------------------------- Update -----------------------------
  Future<void> updateUserCollection(UserModel user) async {
    try {
      await userCollection.doc(user.userId).update((user.toJson()));
      debugPrint(
        'User collection updated successfully!',
      );
    } catch (e) {
      rethrow;
    }
  }
}
