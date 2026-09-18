import 'package:dartz/dartz.dart';
import 'package:fix_now_team_2/core/errors/failure.dart';
import 'package:fix_now_team_2/features/provider/domain/entities/offer_entity.dart';
import 'package:fix_now_team_2/features/provider/domain/repos/offer_repo.dart';

class GetMyOffersUseCase {
  final OfferRepo offerRepo ;
  GetMyOffersUseCase(this.offerRepo);

  Future<Either<Failure,List<OfferEntity>>> call (){
    return offerRepo.getOffers();
  }
}