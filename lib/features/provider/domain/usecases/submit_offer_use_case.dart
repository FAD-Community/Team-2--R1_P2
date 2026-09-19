import 'package:dartz/dartz.dart';
import 'package:fix_now_team_2/core/errors/failure.dart';
import 'package:fix_now_team_2/features/provider/domain/entities/offer_entity.dart';
import 'package:fix_now_team_2/features/provider/domain/repos/offer_repo.dart';

class SubmitOfferUseCase {
  final OfferRepo offerRepo;
  SubmitOfferUseCase( this.offerRepo);

  Future<Either<Failure, OfferEntity>> call({
    required int requestId,
    required double proposedPrice,
    String? message,
  }) async {
   return await offerRepo.submitOffer(
        requestId: requestId,
        proposedPrice: proposedPrice,
        message: message
    );

  }
}
