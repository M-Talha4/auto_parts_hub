// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class FirebaseService {
//   static final FirebaseService _instance = FirebaseService._internal();

//   late FirebaseAuth _auth;
//   late FirebaseFirestore _firestore;
//   late FirebaseStorage _storage;

//   factory FirebaseService() {
//     return _instance;
//   }

//   FirebaseService._internal() {
//     _auth = FirebaseAuth.instance;
//     _firestore = FirebaseFirestore.instance;
//     _storage = FirebaseStorage.instance;
//   }

//   FirebaseAuth get auth => _auth;
//   FirebaseFirestore get firestore => _firestore;
//   FirebaseStorage get storage => _storage;

//   // Add other methods or properties as needed

//   // Example method to get the current user
//   User get currentUser => _auth.currentUser!;
// }
