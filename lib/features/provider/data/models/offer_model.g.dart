// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OfferModel _$OfferModelFromJson(Map<String, dynamic> json) => _OfferModel(
  id: (json['id'] as num).toInt(),
  requestId: (json['requestId'] as num).toInt(),
  technicianId: (json['technicianId'] as num).toInt(),
  proposedPrice: (json['proposedPrice'] as num).toDouble(),
  message: json['message'] as String?,
  status: json['status'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$OfferModelToJson(_OfferModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'requestId': instance.requestId,
      'technicianId': instance.technicianId,
      'proposedPrice': instance.proposedPrice,
      'message': instance.message,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
    };
