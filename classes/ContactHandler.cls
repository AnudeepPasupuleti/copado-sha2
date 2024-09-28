public class ContactHandler {
    
    // Method to update the contact's description based on their lead source
    public static void updateDescriptionBasedOnLeadSource(List<Contact> contacts) {
        for (Contact con : contacts) {
            if (con.LeadSource != null) {
                switch on con.LeadSource {
                    when 'Web' {
                        con.Description = 'Contact originated from our website.';
                    }
                    when 'Phone Inquiry' {
                        con.Description = 'Contact reached out via phone.';
                    }
                    when 'Partner Referral' {
                        con.Description = 'Contact was referred by a partner.';
                    }
                    when else {
                        con.Description = 'Contact from ' + con.LeadSource + ' source.';
                    }
                }
            }
        }
    }
    
    // Method to set a default mailing address if it's blank
    public static void setDefaultMailingAddress(List<Contact> contacts) {
        for (Contact con : contacts) {
            if (String.isBlank(con.MailingStreet) && 
                String.isBlank(con.MailingCity) && 
                String.isBlank(con.MailingState) && 
                String.isBlank(con.MailingPostalCode) && 
                String.isBlank(con.MailingCountry)) {
                
                con.MailingStreet = '123 Default St';
                con.MailingCity = 'Default City';
                con.MailingState = 'Default State';
                con.MailingPostalCode = '12345';
                con.MailingCountry = 'United States';
            }
        }
    }
}