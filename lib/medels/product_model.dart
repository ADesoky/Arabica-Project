class ProductsModel {
  List<ProductsData>? productsData;
  String? status;
  String? message;

  ProductsModel({this.productsData, this.status, this.message});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['products_data'] != null) {
      productsData = <ProductsData>[];
      json['products_data'].forEach((v) {
        productsData!.add(new ProductsData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productsData != null) {
      data['products_data'] =
          this.productsData!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class ProductsData {
  int? itemId;
  String? itemName;
  int? itemPrice;
  String? itemDesc;
  int? itemCategoryId;
  String? coffeeshopItemCategoryName;
  List<CoffeeshopItemImages>? coffeeshopItemImages;

  ProductsData(
      {this.itemId,
        this.itemName,
        this.itemPrice,
        this.itemDesc,
        this.itemCategoryId,
        this.coffeeshopItemCategoryName,
        this.coffeeshopItemImages});

  ProductsData.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemPrice = json['item_price'];
    itemDesc = json['item_desc'];
    itemCategoryId = json['item_category_id'];
    coffeeshopItemCategoryName = json['coffeeshop_item_category_name'];
    if (json['coffeeshop_item_images'] != null) {
      coffeeshopItemImages = <CoffeeshopItemImages>[];
      json['coffeeshop_item_images'].forEach((v) {
        coffeeshopItemImages!.add(new CoffeeshopItemImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['item_name'] = this.itemName;
    data['item_price'] = this.itemPrice;
    data['item_desc'] = this.itemDesc;
    data['item_category_id'] = this.itemCategoryId;
    data['coffeeshop_item_category_name'] = this.coffeeshopItemCategoryName;
    if (this.coffeeshopItemImages != null) {
      data['coffeeshop_item_images'] =
          this.coffeeshopItemImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CoffeeshopItemImages {
  String? coffeeshopItemImageId;
  String? coffeeshopItemImage;
  String? coffeeshopItemId;

  CoffeeshopItemImages(
      {this.coffeeshopItemImageId,
        this.coffeeshopItemImage,
        this.coffeeshopItemId});

  CoffeeshopItemImages.fromJson(Map<String, dynamic> json) {
    coffeeshopItemImageId = json['coffeeshop_item_image_id'];
    coffeeshopItemImage = json['coffeeshop_item_image'];
    coffeeshopItemId = json['coffeeshop_item_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coffeeshop_item_image_id'] = this.coffeeshopItemImageId;
    data['coffeeshop_item_image'] = this.coffeeshopItemImage;
    data['coffeeshop_item_id'] = this.coffeeshopItemId;
    return data;
  }
}
