namespace FixNow.Domain.Enums
{
    public static class Enums
    {
        public enum Role
        {
            Customer,
            Technician,
            Admin
        }

        public enum VerificationStatus
        {
            Pending,
            Verified,
            Rejected
        }

        public enum RequestStatus
        {
            Created,
            UnderReview,
            Offered,
            Accepted,
            Scheduled,
            InProgress,
            Completed,
            Confirmed,
            Closed,
            Cancelled,
            Disputed
        }

        public enum OfferStatus
        {
            Pending,
            Accepted,
            Rejected,
            Withdrawn
        }

        public enum AttachmentType
        {
            RequestPhoto,
            CompletionProof
        }

        public enum PaymentMethod
        {
            Cash,
            Card,
            Wallet
        }

        public enum PaymentStatus
        {
            Pending,
            Paid,
            Failed,
            Refunded
        }
        public enum OtpPurpose
        {
            Registration,
            PasswordReset
        }
        public enum DocumentType
        {
            NationalIdFront,
            NationalIdBack,
            ProfilePhoto
        }
    }
}
