public with sharing class AccountProcessor {
    @future
    public static void countContacts(List<Id> recordIds) {
      List<Account> lAccs = [SELECT Id, Name, Number_of_Contacts__c, (SELECT Id FROM Contacts) 
        FROM Account WHERE Id IN :recordIds];

      for( Account acc : lAccs ) {
          List<Contact> lstCont = acc.contacts ;
          acc.Number_of_Contacts__c = lstCont.size();
      }

      update lAccs;
    }
    
}
