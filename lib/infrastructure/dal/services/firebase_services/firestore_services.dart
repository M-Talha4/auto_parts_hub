import 'package:auto_parts_hub/infrastructure/dal/models/credit_card_models/credit_card_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:auto_parts_hub/domain/const/const.dart';
import 'package:auto_parts_hub/domain/const/static_data.dart';
import 'package:auto_parts_hub/domain/core/entities/cart_entities/cart.dart';
import 'package:auto_parts_hub/domain/core/entities/order_entities/order.dart';
import 'package:auto_parts_hub/domain/core/entities/product_entities/product.dart';
import 'package:auto_parts_hub/domain/core/entities/address_entities/address.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/cart_models/cart_model.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/order_models/order_model.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/address_models/address_model.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/product_models/product_model.dart';

class FireStoreServices extends GetxService {
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection(firebaseUsersCollection);
  CollectionReference productsCollection =
      FirebaseFirestore.instance.collection(firebaseProductsCollection);
  late CollectionReference addressCollection;
  late CollectionReference cardCollection;
  late CollectionReference cartCollection;
  late CollectionReference orderCollection;
  List<Product> productList = [];
  List<Orders> orderList = [];
  @override
  onInit() {
    _loggedIn();
    super.onInit();
  }

  Future<void> _loggedIn() async {
    addressCollection = usersCollection
        .doc(StaticData.userId)
        .collection(firebaseUsersSubCollectionAddress);
    cardCollection = usersCollection
        .doc(StaticData.userId)
        .collection(firebaseUsersSubCollectionCard);
    cartCollection = usersCollection
        .doc(StaticData.userId)
        .collection(firebaseUsersSubCollectionCart);
    orderCollection = usersCollection
        .doc(StaticData.userId)
        .collection(firebaseUsersSubCollectionOrder);
    productList = await getProductsList();
    orderList = await getOrdersList() ?? [];
  }

// ----------------------------Products ----------------------------------
  Future<List<Product>> getProductsList() async {
    try {
      QuerySnapshot querySnapshot = await productsCollection.get();
      if (querySnapshot.docs.isEmpty) {
        return [];
      } else {
        return querySnapshot.docs
            .map((doc) =>
                ProductModel.fromMap(doc.data() as Map<String, dynamic>))
            .toList();
      }
    } catch (e) {
      rethrow;
    }
  }

// ---------------------------------- Cart ------------------------------------
  Future<List<Cart>> getCartItems() async {
    try {
      QuerySnapshot querySnapshot = await cartCollection.get();
      if (querySnapshot.docs.isEmpty) {
        return [];
      } else {
        return querySnapshot.docs
            .map((doc) => CartModel.fromMap(doc.data() as Map<String, dynamic>))
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
        await cartCollection.doc(cartItem.itemId).set(cartItem.toMap());
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
          .doc(StaticData.userId)
          .collection(firebaseUsersSubCollectionCart);
      for (var item in cartItems) {
        await cartCollection.doc(item.itemId).delete();
      }
    } catch (e) {
      rethrow;
    }
  }

// ----------------------------Address Cllection----------------------------------
  Future<List<Address>> getAddressList() async {
    try {
      QuerySnapshot querySnapshot = await addressCollection.get();
      if (querySnapshot.docs.isEmpty) {
        return [];
      } else {
        return querySnapshot.docs
            .map((doc) =>
                AddressModel.fromMap(doc.data() as Map<String, dynamic>))
            .toList();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addAddress(AddressModel address) async {
    try {
      await addressCollection.doc(address.id).set(address.toMap());
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

  Future<List<CreditCardModel>?> getCardList() async {
    try {
      QuerySnapshot querySnapshot = await cardCollection.get();
      if (querySnapshot.docs.isEmpty) {
        return [];
      } else {
        return querySnapshot.docs
            .map((doc) =>
                CreditCardModel.fromMap(doc.data() as Map<String, dynamic>))
            .toList();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addCard(CreditCardModel card) async {
    try {
      await cardCollection.doc(card.id).set(card.toMap());
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

  Future<List<Orders>?> getOrdersList() async {
    try {
      QuerySnapshot querySnapshot = await orderCollection.get();
      if (querySnapshot.docs.isEmpty) {
        return [];
      } else {
        return querySnapshot.docs
            .map((doc) =>
                OrdersModel.fromMap(doc.data() as Map<String, dynamic>))
            .toList();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> submitOrder(OrdersModel order) async {
    try {
      await orderCollection.doc(order.orderId).set(order.toMap());
      await deleteCartCollection(order.cartItems!);
    } catch (e) {
      rethrow;
    }
  }
}
