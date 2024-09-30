public class ContactHandler {
    
    public static void updateContactDescription(List<Contact> contacts) {
        for (Contact con : contacts) {
            if (con.Email != null && con.Phone != null) {
                con.Description = 'Primary contact';
            } else if (con.Email != null || con.Phone != null) {
                con.Description = 'Secondary contact';
            } else {
                con.Description = 'Incomplete contact information';
            }
        }
    }
    
    public static void setLeadSource(List<Contact> contacts) {
        for (Contact con : contacts) {
            if (con.HasOptedOutOfEmail) {
                con.LeadSource = 'Phone Inquiry';
            } else if (con.DoNotCall) {
                con.LeadSource = 'Web';
            } else {
                con.LeadSource = 'Other';
            }
        }
    }
}