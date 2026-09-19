class OfferEntity {
  final int id;
  final int requestId;
  final int technicianId;
  final double proposedPrice;
  final String? message;
  final String status;
  final DateTime createdAt;

  const OfferEntity({
    required this.id,
    required this.requestId,
    required this.technicianId,
    required this.proposedPrice,
    this.message,
    required this.status,
    required this.createdAt,
  });
}