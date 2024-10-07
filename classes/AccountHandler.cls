public class AccountHandler {
    
    public static void updateAccountDescription(List<Account> accounts) {
        for (Account acc : accounts) {
            if (acc.AnnualRevenue != null) {
                if (acc.AnnualRevenue > 1000000) {
                    acc.Description = 'Large enterprise account';
                } else if (acc.AnnualRevenue > 100000) {
                    acc.Description = 'Mid-market account';
                } else {
                    acc.Description = 'Small business account';
                }
            }
        }
    }
    
    public static void updateAccountRating(List<Account> accounts) {
        for (Account acc : accounts) {
            if (acc.Type == 'Customer - Direct' && acc.AnnualRevenue > 500000) {
                acc.Rating = 'Hot';
            } else if (acc.Type == 'Customer - Channel') {
                acc.Rating = 'Warm';
            } else {
                acc.Rating = 'Cold';
            }
        }
    }
}