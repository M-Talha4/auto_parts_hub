import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/domain/const/const.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import '/infrastructure/dal/models/user_models/user_model.dart';

class UserServices extends GetxService {
  UserServices();
  final firebase_auth.FirebaseAuth _firebaseAuth =
      firebase_auth.FirebaseAuth.instance;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection(firebaseUsersCollection);
  CollectionReference adminCollection =
      FirebaseFirestore.instance.collection(firebaseAdminCollection);

  final Rx<UserModel> _user = UserModel(
          userId: '',
          name: '',
          email: '',
          isAdmin: false,
          language: '',
          phoneNo: '',
          profileImage: '',
          fcmToken: '')
      .obs;
  Rx<UserModel> get user => _user;

// ---------------------------- Get ----------------------------------

  Future<void> getUserData() async {
    try {
      String userId = _firebaseAuth.currentUser?.uid ?? '';
      if (userId.isEmpty) return;
      DocumentSnapshot doc = await adminCollection.doc(userId).get();
      if (doc.exists) {
        _user.value = await compute((data) => UserModel.fromJson(data),
            doc.data() as Map<String, dynamic>);
        return;
      }

      doc = await userCollection.doc(userId).get();

      if (doc.exists) {
        _user.value = await compute((data) => UserModel.fromJson(data),
            doc.data() as Map<String, dynamic>);
        return;
      }
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
