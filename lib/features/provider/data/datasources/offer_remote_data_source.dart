import '../models/offer_model.dart';

// التعامل المباشر مع ال API

abstract class OfferRemoteDataSource {
  Future<List<OfferModel>> getOffers();

  Future<OfferModel> submitOffer({
    required int requestId,
    required double proposedPrice,
    String? message,
  });
}