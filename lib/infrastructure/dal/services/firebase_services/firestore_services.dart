import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/domain/const/const.dart';
import '/domain/core/entities/order_entities/order_entity.dart';
import '/domain/core/entities/product_entities/product_entity.dart';
import '/infrastructure/dal/models/cart_models/cart_model.dart';
import '/infrastructure/dal/models/user_models/user_model.dart';
import '/infrastructure/dal/models/order_models/order_model.dart';
import '/infrastructure/dal/models/address_models/address_model.dart';
import '/infrastructure/dal/models/product_models/product_model.dart';
import '/infrastructure/dal/models/credit_card_models/credit_card_model.dart';
import 'user_services.dart';

class FireStoreServices extends GetxService {
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection(firebaseUsersCollection);
  CollectionReference productsCollection =
      FirebaseFirestore.instance.collection(firebaseProductsCollection);
  late CollectionReference orderCollection =
      FirebaseFirestore.instance.collection(firebaseOrderCollection);
  late CollectionReference addressCollection;
  late CollectionReference cardCollection;
  late CollectionReference cartCollection;
  List<ProductEntity> productList = [];
  List<OrdersEntity> orderList = [];

  @override
  onInit() {
    loggedIn(Get.find<UserServices>().user.value.userId);
    super.onInit();
  }

  Future<void> loggedIn(String userId) async {
    if (userId == '') return;
    try {
      addressCollection = usersCollection
          .doc(userId)
          .collection(firebaseUsersSubCollectionAddress);
      cardCollection = usersCollection
          .doc(userId)
          .collection(firebaseUsersSubCollectionCard);
      cartCollection = usersCollection
          .doc(userId)
          .collection(firebaseUsersSubCollectionCart);
      productList = await getProductsList();
      orderList = await getOrdersList();
    } catch (e) {
      rethrow;
    }
  }

// ---------------------------- Products ----------------------------------
  Future<List<ProductModel>> getProductsList() async {
    try {
      QuerySnapshot querySnapshot = await productsCollection.get();
      if (querySnapshot.docs.isEmpty) {
        return [];
      } else {
        return querySnapshot.docs
            .map((doc) =>
                ProductModel.fromJson(doc.data() as Map<String, dynamic>))
            .toList();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addProduct(ProductModel product) async {
    try {
      await productsCollection.doc(product.productId).set(product.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateProduct(ProductModel product) async {
    try {
      await productsCollection.doc(product.productId).update(product.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteProduct(String productId) async {
    try {
      await productsCollection.doc(productId).delete();
    } catch (e) {
      rethrow;
    }
  }

// ---------------------------------- Cart ------------------------------------
  Future<List<CartModel>> getCartItems() async {
    try {
      QuerySnapshot querySnapshot = await cartCollection.get();
      if (querySnapshot.docs.isEmpty) {
        return [];
      } else {
        return querySnapshot.docs
            .map(
                (doc) => CartModel.fromJson(doc.data() as Map<String, dynamic>))
            .toList();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> addCartItems(CartModel cartItem) async {
    try {
      DocumentSnapshot docSnapshot =
          await cartCollection.doc(cartItem.itemId).get();
      if (!docSnapshot.exists) {
        await cartCollection.doc(cartItem.itemId).set(cartItem.toJson());
        return 'done';
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateCartItems(
      {required String itemId, required int count}) async {
    try {
      cartCollection.doc(itemId).update({'itemCount': count});
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteCartItems(id) async {
    try {
      await cartCollection.doc(id).delete();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteCartCollection(List<CartModel> cartItems) async {
    try {
      CollectionReference cartCollection = FirebaseFirestore.instance
          .collection(firebaseUsersCollection)
          .doc(Get.find<UserServices>().user.value.userId)
          .collection(firebaseUsersSubCollectionCart);
      for (var item in cartItems) {
        await cartCollection.doc(item.itemId).delete();
      }
    } catch (e) {
      rethrow;
    }
  }

// ----------------------------Address Cllection----------------------------------
  Future<List<AddressModel>> getAddressList() async {
    try {
      QuerySnapshot querySnapshot = await addressCollection.get();
      if (querySnapshot.docs.isEmpty) {
        return [];
      } else {
        return querySnapshot.docs
            .map((doc) =>
                AddressModel.fromJson(doc.data() as Map<String, dynamic>))
            .toList();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addAddress(AddressModel address) async {
    try {
      await addressCollection.doc(address.id).set(address.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteAddress(String id) async {
    try {
      await addressCollection.doc(id).delete();
    } catch (e) {
      rethrow;
    }
  }

  // //------------------------------------Card/Payment----------------

  Future<List<CreditCardModel>> getCardList() async {
    try {
      QuerySnapshot querySnapshot = await cardCollection.get();
      if (querySnapshot.docs.isEmpty) {
        return [];
      } else {
        return querySnapshot.docs
            .map((doc) =>
                CreditCardModel.fromJson(doc.data() as Map<String, dynamic>))
            .toList();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addCard(CreditCardModel card) async {
    try {
      await cardCollection.doc(card.id).set(card.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteCard(String id) async {
    try {
      await cardCollection.doc(id).delete();
    } catch (e) {
      rethrow;
    }
  }

  // //------------------------------- Order  ----------------------------------

  Future<List<OrdersModel>> getOrdersList() async {
    try {
      QuerySnapshot querySnapshot = await orderCollection.get();
      if (querySnapshot.docs.isEmpty) {
        return [];
      } else {
        return querySnapshot.docs
            .map((doc) =>
                OrdersModel.fromJson(doc.data() as Map<String, dynamic>))
            .toList();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> submitOrder(OrdersModel order) async {
    try {
      await orderCollection.doc(order.orderId).set(order.toJson());
      await deleteCartCollection(order.cartItems!);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateOrder(String orderId, String orderStatus) async {
    try {
      await orderCollection.doc(orderId).update({'orderStatus': orderStatus});
    } catch (e) {
      rethrow;
    }
  }

//------------------------------ User ---------------------------------

  Future<List<UserModel>> getUsersCollection() async {
    try {
      QuerySnapshot querySnapshot = await usersCollection.get();
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

  Future<void> deleteUser(String userId) async {
    try {
      DocumentReference documentReference = usersCollection.doc(userId);
      DocumentSnapshot documentSnapshot = await documentReference.get();
      if (documentSnapshot.exists) {
        _deleteCollection(documentReference, firebaseUsersSubCollectionAddress);
        _deleteCollection(documentReference, firebaseUsersSubCollectionCard);
        _deleteCollection(documentReference, firebaseUsersSubCollectionCart);

        //delete related order
        orderCollection
            .where('customerId', isEqualTo: userId)
            .get()
            .then((QuerySnapshot querySnapshot) {
          for (var query in querySnapshot.docs) {
            query.reference.delete();
          }
        });
      }
      await usersCollection.doc(userId).delete();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _deleteCollection(
      DocumentReference documentReference, String collectionName) async {
    documentReference
        .collection(collectionName)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var query in querySnapshot.docs) {
        query.reference.delete();
      }
    });
  }
}
