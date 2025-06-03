import 'dart:io';
import '/domain/const/static_data.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class FirebaseStorageService extends GetxService {
  Reference storageReference = FirebaseStorage.instance.ref();

  Future<String> uploadProfileImage(File file) async {
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

  Future<String> uploadProductImage(File file) async {
    try {
      String id = DateTime.now().toString();
      String url;
      Reference imageRef = storageReference.child('products/$id.png');
      TaskSnapshot snapshot = await imageRef.putFile(file);
      debugPrint(snapshot.toString());
      url = await imageRef.getDownloadURL();
      List<String> list = [id, url];
      return list.join('_');
    } catch (e) {
      rethrow;
    }
  }
}
