import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:auto_parts_hub/domain/const/const.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:auto_parts_hub/domain/core/entities/user_entities/user.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/user_models/user_model.dart';

class AuthServices extends GetxService {
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

  Future<UserModel> getUserCollection(String uid) async {
    try {
      DocumentSnapshot doc = await userCollection.doc(uid).get();
      return UserModel.fromMap(doc.data() as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getAdminCollection(String uid) async {
    try {
      DocumentSnapshot doc = await adminCollection.doc(uid).get();
      return UserModel.fromMap(doc.data() as Map<String, dynamic>);
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
          .map((doc) => UserModel.fromMap(doc.data() as Map<String, dynamic>))
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
          .map((doc) => UserModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  // ---------------------------- Signup ----------------------------------
  Future<String?> signUpWithEmailAndPassword(User user, String password) async {
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
      await userCollection.doc(user.userId).set(user.toMap());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createAdminCollection(UserModel user) async {
    try {
      await adminCollection.doc(user.userId).set(user.toMap());
    } catch (e) {
      rethrow;
    }
  }

  //----------------------------- Update -----------------------------
  Future<void> updateUserCollection(UserModel user) async {
    try {
      await userCollection.doc(user.userId).update((user.toMap()));
      debugPrint(
        'User collection updated successfully!',
      );
    } catch (e) {
      rethrow;
    }
  }
}
