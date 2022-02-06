@isTest
public class AddPrimaryContactTest {
    @isTest 
    public static void TestList(){

        List<Account> lAccounts = new List <Account>();
        for(Integer i=0;i<50;i++){
            lAccounts.add(new Account(BillingState = 'CA', name = 'Test'+i));
        }
        for(Integer j=0;j<50;j++){
            lAccounts.add(new Account(BillingState = 'NY', name = 'Test'+j));
        }
        insert lAccounts;

        Contact co = new Contact( FirstName ='demo', LastName ='demo');
        insert co;
        
        String state = 'CA';
        AddPrimaryContact apc = new AddPrimaryContact(co, state);
        Test.startTest();
        System.enqueueJob(apc);
        Test.stopTest();
    }
 }