// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemRequestImpl _$$ItemRequestImplFromJson(Map<String, dynamic> json) =>
    _$ItemRequestImpl(
      id: (json['id'] as num?)?.toInt() ?? null,
      title: json['title'] as String? ?? null,
      description: json['description'] as String? ?? null,
      price: (json['price'] as num?)?.toInt() ?? null,
      discountPercentage:
          (json['discountPercentage'] as num?)?.toDouble() ?? null,
      rating: (json['rating'] as num?)?.toDouble() ?? null,
      stock: (json['stock'] as num?)?.toInt() ?? null,
      brand: json['brand'] as String? ?? null,
      category: json['category'] as String? ?? null,
      thumbnail: json['thumbnail'] as String? ?? null,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ItemRequestImplToJson(_$ItemRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'discountPercentage': instance.discountPercentage,
      'rating': instance.rating,
      'stock': instance.stock,
      'brand': instance.brand,
      'category': instance.category,
      'thumbnail': instance.thumbnail,
      'images': instance.images,
    };
