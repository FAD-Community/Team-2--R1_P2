
namespace FixNow.Domain.Enums
{
    public class Enums
    {

    public enum VerificationStatus
    {
        Pending,
        Verified,
        Rejected
    }
    public enum Role
        {
            Customer,
            Technician,
            Admin
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


    }
}
