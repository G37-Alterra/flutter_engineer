class ProductsCategory {
  String? message;
  int? rescode;
  ResultProduct? result;

  ProductsCategory({this.message, this.rescode, this.result});

  ProductsCategory.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    rescode = json['rescode'];
    result = json['result'] != null
        ? new ResultProduct.fromJson(json['result'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['rescode'] = this.rescode;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class ResultProduct {
  List<Products>? products;

  ResultProduct({this.products});

  ResultProduct.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? iD;
  String? name;
  String? productSlug;
  int? categoryId;
  String? image;
  bool? status;

  Products(
      {this.iD,
      this.name,
      this.productSlug,
      this.categoryId,
      this.image,
      this.status});

  Products.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
    productSlug = json['Product_Slug'];
    categoryId = json['Category_Id'];
    image = json['Image'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Name'] = this.name;
    data['Product_Slug'] = this.productSlug;
    data['Category_Id'] = this.categoryId;
    data['Image'] = this.image;
    data['Status'] = this.status;
    return data;
  }
}
