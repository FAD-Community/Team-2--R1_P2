import 'package:dartz/dartz.dart';
import 'package:fix_now_team_2/core/errors/failure.dart';
import 'package:fix_now_team_2/features/provider/domain/entities/offer_entity.dart';

abstract class OfferRepo {
  Future<Either <Failure,List<OfferEntity>>> getOffers();

  Future<Either<Failure,OfferEntity>> submitOffer({
    required int requestId,
    required double proposedPrice,
    String? message,
});
}