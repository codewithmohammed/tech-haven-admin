import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tech_haven_admin/model/banner_model.dart';
import 'package:tech_haven_admin/model/category_model.dart';
import 'package:tech_haven_admin/model/product_model.dart';
import 'package:uuid/uuid.dart';

class BannerUploadProvider extends ChangeNotifier {
  String? currentSelectedValue;
  Uint8List? bannerImage;
  ProductModel? currentProductModel;

  void changeCurrentSelectedValue(
      {required String value, required ProductModel productModel}) {
    currentSelectedValue = value;
    currentProductModel = productModel;
    notifyListeners();
  }

  bool isLoadingBanner = false;
  Uint8List? brandImage;
  bool isLoadingbrand = false;
  TextEditingController brandNameTextEditingController =
      TextEditingController();

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  void assignBannerImage(Uint8List image) {
    bannerImage = image;
    notifyListeners();
  }

  void assignbrandImage(Uint8List image) {
    brandImage = image;
    notifyListeners();
  }

  Future<void> uploadBrandToFirebase({required String brandName}) async {
    isLoadingbrand = true;
    notifyListeners();
    String brandID = const Uuid().v1();
//reference for maincategory
    Reference reference =
        firebaseStorage.ref('brand').child(brandID).child(brandID);

    UploadTask uploadTask = reference.putData(brandImage!);
    TaskSnapshot taskSnapshot = await uploadTask;

    final downloadURL = await taskSnapshot.ref.getDownloadURL();

    final CollectionReference collectionReference =
        firebaseFirestore.collection('brand');
    CategoryModel brandModel = CategoryModel(
      id: brandID,
      categoryName: brandName,
      imageURL: downloadURL,
    );
    await collectionReference.doc(brandID).set(brandModel.toJson());
    isLoadingbrand = false;
    brandImage = null;
    brandNameTextEditingController.clear();
    notifyListeners();
  }

  Future<void> uploadBannerToFirebase() async {
    isLoadingBanner = true;
    notifyListeners();
    String bannerImageID = const Uuid().v1();

    Reference reference = firebaseStorage.ref('banners').child(bannerImageID);

    UploadTask uploadTask = reference.putData(bannerImage!);
    TaskSnapshot taskSnapshot = await uploadTask;

    final downloadURL = await taskSnapshot.ref.getDownloadURL();
    final CollectionReference collectionReference =
        firebaseFirestore.collection('banners');

    BannerModel bannerModel = BannerModel(
      productID: currentProductModel!.productID,
      name: currentProductModel!.name,
      id: bannerImageID,
      imageURL: downloadURL,
    );

    collectionReference.doc(bannerImageID).set(bannerModel.toJson());
    isLoadingBanner = false;
    bannerImage = null;
    notifyListeners();
  }

  Stream<List<ProductModel>> getAllProductFirebaseStream() {
    return firebaseFirestore.collection('products').snapshots().map(
      (QuerySnapshot snapshot) {
        return snapshot.docs.map((DocumentSnapshot documentSnapshot) {
          var snapshot = documentSnapshot.data() as Map<String, dynamic>;
          return ProductModel.fromJson(snapshot);
        }).toList();
      },
    );
  }
}
