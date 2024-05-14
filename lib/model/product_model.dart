class ProductModel {
  final String productID;
  final String vendorName;
  final String brandName;
  final String displayImageURL;
  final String name;
  final double prize;
  final int quantity;
  final String mainCategory;
  final String mainCategoryID;
  final String subCategory;
  final String subCategoryID;
  final String variantCategory;
  final String variantCategoryID;
  final String overview;
  final Map<String, String>? specifications;
  final double? shippingCharge;

  // final Map<int,List<Image>> productImages;
  final double? rating;
  final bool isPublished;

  ProductModel({
    required this.productID,
    required this.vendorName,
    required this.brandName,
    required this.displayImageURL,
    required this.name,
    required this.prize,
    required this.quantity,
    required this.mainCategory,
    required this.mainCategoryID,
    required this.subCategory,
    required this.subCategoryID,
    required this.variantCategory,
    required this.variantCategoryID,
    required this.overview,
    required this.specifications,
    required this.shippingCharge,
    // required this.productImages,
    required this.rating,
    required this.isPublished,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productID: json['productID'],
      vendorName: json['vendorName'],
      brandName: json['brandName'],
      displayImageURL: json['displayImageURL'],
      name: json['name'],
      prize: json['prize'],
      quantity: json['quantity'],
      mainCategory: json['mainCategory'],
      mainCategoryID: json['mainCategoryID'],
      subCategory: json['subCategory'],
      subCategoryID: json['subCategoryID'],
      variantCategory: json['variantCategory'],
      variantCategoryID: json['variantCategoryID'],
      overview: json['overview'],
      specifications: json['specifications'] != null
          ? Map<String, String>.from(json['specifications'])
          : null,
      shippingCharge: json['shippingCharge'],
      rating: json['rating'],
      isPublished: json['isPublished'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productID': productID,
      'vendorName': vendorName,
      'brandName': brandName,
      'displayImageURL': displayImageURL,
      'name': name,
      'prize': prize,
      'quantity': quantity,
      'mainCategory': mainCategory,
      'mainCategoryID': mainCategoryID,
      'subCategory': subCategory,
      'subCategoryID': subCategoryID,
      'variantCategory': variantCategory,
      'variantCategoryID': variantCategoryID,
      'overview': overview,
      'specifications': specifications ?? {},
      'shippingCharge': shippingCharge ?? 0,
      'rating': rating ?? 0,
      'isPublished': isPublished,
    };
  }
}
