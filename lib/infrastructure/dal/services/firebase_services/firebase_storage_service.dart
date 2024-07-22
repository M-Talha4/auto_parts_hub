import 'dart:io';
import 'package:auto_parts_hub/domain/const/static_data.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class FirebaseStorageService extends GetxService {
  Reference storageReference = FirebaseStorage.instance.ref();

  Future<String?> uploadProfileImage(File file) async {
    try {
      Reference imageRef =
          storageReference.child('profileImages/${StaticData.userId}.png');
      TaskSnapshot snapshot = await imageRef.putFile(file);
      debugPrint(snapshot.toString());
      return await imageRef.getDownloadURL();
    } catch (e) {
      rethrow;
    }
  }
}
