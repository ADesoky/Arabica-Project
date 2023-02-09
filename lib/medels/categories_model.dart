class Categories {
  List<CategoryData>? categoryData;
  String? status;
  String? message;

  Categories({this.categoryData, this.status, this.message});

  Categories.fromJson(Map<String, dynamic> json) {
    if (json['category_data'] != null) {
      categoryData = <CategoryData>[];
      json['category_data'].forEach((v) {
        categoryData!.add(new CategoryData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categoryData != null) {
      data['category_data'] =
          this.categoryData!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class CategoryData {
  int? coffeeshopItemCategoryId;
  String? coffeeshopItemCategoryName;
  String? coffeeshopItemCategoryDesc;
  String? coffeeshopItemCategoryImg;

  CategoryData(
      {this.coffeeshopItemCategoryId,
        this.coffeeshopItemCategoryName,
        this.coffeeshopItemCategoryDesc,
        this.coffeeshopItemCategoryImg});

  CategoryData.fromJson(Map<String, dynamic> json) {
    coffeeshopItemCategoryId = json['coffeeshop_item_category_id'];
    coffeeshopItemCategoryName = json['coffeeshop_item_category_name'];
    coffeeshopItemCategoryDesc = json['coffeeshop_item_category_desc'];
    coffeeshopItemCategoryImg = json['coffeeshop_item_category_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coffeeshop_item_category_id'] = this.coffeeshopItemCategoryId;
    data['coffeeshop_item_category_name'] = this.coffeeshopItemCategoryName;
    data['coffeeshop_item_category_desc'] = this.coffeeshopItemCategoryDesc;
    data['coffeeshop_item_category_img'] = this.coffeeshopItemCategoryImg;
    return data;
  }
}
