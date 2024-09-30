@IsTest
private class HandlerTest {
    
    // Tests for ContactHandler
    @IsTest
    static void testUpdateContactDescription() {
        List<Contact> contacts = new List<Contact>{
            new Contact(LastName = 'Test1', Email = 'test1@example.com', Phone = '1234567890'),
            new Contact(LastName = 'Test2', Email = 'test2@example.com'),
            new Contact(LastName = 'Test3')
        };
        
        Test.startTest();
        ContactHandler.updateContactDescription(contacts);
        Test.stopTest();
        
        System.assertEquals('Primary contact', contacts[0].Description);
        System.assertEquals('Secondary contact', contacts[1].Description);
        System.assertEquals('Incomplete contact information', contacts[2].Description);
    }
    
    @IsTest
    static void testSetLeadSource() {
        List<Contact> contacts = new List<Contact>{
            new Contact(LastName = 'Test1', HasOptedOutOfEmail = true),
            new Contact(LastName = 'Test2', DoNotCall = true),
            new Contact(LastName = 'Test3')
        };
        
        Test.startTest();
        ContactHandler.setLeadSource(contacts);
        Test.stopTest();
        
        System.assertEquals('Phone Inquiry', contacts[0].LeadSource);
        System.assertEquals('Web', contacts[1].LeadSource);
        System.assertEquals('Other', contacts[2].LeadSource);
    }
    
    // Tests for AccountHandler
    @IsTest
    static void testUpdateAccountDescription() {
        List<Account> accounts = new List<Account>{
            new Account(Name = 'Test1', AnnualRevenue = 2000000),
            new Account(Name = 'Test2', AnnualRevenue = 500000),
            new Account(Name = 'Test3', AnnualRevenue = 50000)
        };
        
        Test.startTest();
        AccountHandler.updateAccountDescription(accounts);
        Test.stopTest();
        
        System.assertEquals('Large enterprise account', accounts[0].Description);
        System.assertEquals('Mid-market account', accounts[1].Description);
        System.assertEquals('Small business account', accounts[2].Description);
    }
    
    @IsTest
    static void testUpdateAccountRating() {
        List<Account> accounts = new List<Account>{
            new Account(Name = 'Test1', Type = 'Customer - Direct', AnnualRevenue = 1000000),
            new Account(Name = 'Test2', Type = 'Customer - Channel'),
            new Account(Name = 'Test3', Type = 'Prospect')
        };
        
        Test.startTest();
        AccountHandler.updateAccountRating(accounts);
        Test.stopTest();
        
        System.assertEquals('Hot', accounts[0].Rating);
        System.assertEquals('Warm', accounts[1].Rating);
        System.assertEquals('Cold', accounts[2].Rating);
    }
}