@IsTest
public with sharing class AccountProcessorTest {
    @IsTest
    public static void AccountProcessorTest() {
        Boolean needsApproval = false; 
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;

        Contact cont = new Contact();
        cont.FirstName ='Test';
        cont.LastName ='Contact';
        cont.AccountId = acc.Id;
        insert cont;
        
        List<Id> lIds = new List<Id>();
        lIds.add(acc.Id);
 
        Test.startTest();
            AccountProcessor.countContacts(lIds);
        Test.stopTest();
        
        Account accRes = [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id =:acc.Id LIMIT 1];
        System.assertEquals(Integer.valueOf(accRes.Number_of_Contacts__c),1, 'Count of contacts expected was not 1');
        if (needsApproval) {
            needsApproval = true;
            System.assertEquals(false, needsApproval, '1');
        }else{
            System.assertEquals(false, needsApproval, '2');
        }

    }
}

