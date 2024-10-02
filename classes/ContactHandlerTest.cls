@IsTest
private class ContactHandlerTest {
    
    @IsTest
    static void testUpdateDescriptionBasedOnLeadSource() {
        // Create test contacts
        List<Contact> testContacts = new List<Contact>{
            new Contact(FirstName = 'Test1', LastName = 'Contact1', LeadSource = 'Web'),
            new Contact(FirstName = 'Test2', LastName = 'Contact2', LeadSource = 'Phone Inquiry'),
            new Contact(FirstName = 'Test3', LastName = 'Contact3', LeadSource = 'Partner Referral'),
            new Contact(FirstName = 'Test4', LastName = 'Contact4', LeadSource = 'Other')
        };
        
        Test.startTest();
        ContactHandler.updateDescriptionBasedOnLeadSource(testContacts);
        Test.stopTest();
        
        // Verify results
        System.assertEquals('Contact originated from our website.', testContacts[0].Description);
        System.assertEquals('Contact reached out via phone.', testContacts[1].Description);
        System.assertEquals('Contact was referred by a partner.', testContacts[2].Description);
        System.assertEquals('Contact from Other source.', testContacts[3].Description);
    }
    
    @IsTest
    static void testSetDefaultMailingAddress() {
        // Create test contacts
        List<Contact> testContacts = new List<Contact>{
            new Contact(FirstName = 'Test1', LastName = 'Contact1'),
            new Contact(FirstName = 'Test2', LastName = 'Contact2', MailingStreet = '456 Existing St', MailingCity = 'Existing City')
        };
        
        Test.startTest();
        ContactHandler.setDefaultMailingAddress(testContacts);
        Test.stopTest();
        
        // Verify results
        System.assertEquals('123 Default St', testContacts[0].MailingStreet);
        System.assertEquals('Default City', testContacts[0].MailingCity);
        System.assertEquals('Default State', testContacts[0].MailingState);
        System.assertEquals('12345', testContacts[0].MailingPostalCode);
        System.assertEquals('United States', testContacts[0].MailingCountry);
        
        System.assertEquals('456 Existing St', testContacts[1].MailingStreet);
        System.assertEquals('Existing City', testContacts[1].MailingCity);
        System.assertEquals(null, testContacts[1].MailingState);
        System.assertEquals(null, testContacts[1].MailingPostalCode);
        System.assertEquals(null, testContacts[1].MailingCountry);
    }
}