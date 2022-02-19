import 'dart:convert';
import 'package:get/get.dart';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  //variables
  Rx<bool> isFavorite = false.obs;

  //from api
  final int? id;
  final String? brand;
  final String? name;
  final String? price;
  final dynamic priceSign;
  final dynamic currency;
  final String? imageLink;
  final String? productLink;
  final String? websiteLink;
  final String? description;
  final num? rating;
  final dynamic category;
  final String? productType;
  final List<dynamic>? tagList;
  final String? createdAt;
  final String? updatedAt;
  final String? productApiUrl;
  final String? apiFeaturedImage;
  final List<dynamic>? productColors;

  Product({
    this.id,
    this.brand,
    this.name,
    this.price,
    this.priceSign,
    this.currency,
    this.imageLink,
    this.productLink,
    this.websiteLink,
    this.description,
    this.rating,
    this.category,
    this.productType,
    this.tagList,
    this.createdAt,
    this.updatedAt,
    this.productApiUrl,
    this.apiFeaturedImage,
    this.productColors,
  });

  factory Product.fromJson(Map<String, dynamic> data) => Product(
        id: data['id'] as int?,
        brand: data['brand'] as String?,
        name: data['name'] as String?,
        price: data['price'] as String?,
        priceSign: data['price_sign'] as dynamic,
        currency: data['currency'] as dynamic,
        imageLink: data['image_link'] as String?,
        productLink: data['product_link'] as String?,
        websiteLink: data['website_link'] as String?,
        description: data['description'] as String?,
        rating: data['rating'] as num?,
        category: data['category'] as dynamic,
        productType: data['product_type'] as String?,
        tagList: data['tag_list'] as List<dynamic>?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
        productApiUrl: data['product_api_url'] as String?,
        apiFeaturedImage: data['api_featured_image'] as String?,
        productColors: data['product_colors'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'brand': brand,
        'name': name,
        'price': price,
        'price_sign': priceSign,
        'currency': currency,
        'image_link': imageLink,
        'product_link': productLink,
        'website_link': websiteLink,
        'description': description,
        'rating': rating,
        'category': category,
        'product_type': productType,
        'tag_list': tagList,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'product_api_url': productApiUrl,
        'api_featured_image': apiFeaturedImage,
        'product_colors': productColors,
      };
}
