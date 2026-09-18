import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/offer_entity.dart';

part 'offer_model.freezed.dart';
part 'offer_model.g.dart';

@freezed
abstract class OfferModel with _$OfferModel {
  const factory OfferModel({
    required int id,
    required int requestId,
    required int technicianId,
    required double proposedPrice,
    String? message,
    required String status,
    required DateTime createdAt,
  }) = _OfferModel;

  factory OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);
}
extension OfferModelMapper on OfferModel {
  OfferEntity toEntity() {
    return OfferEntity(
      id: id,
      requestId: requestId,
      technicianId: technicianId,
      proposedPrice: proposedPrice,
      message: message,
      status: status,
      createdAt: createdAt,
    );
  }
}