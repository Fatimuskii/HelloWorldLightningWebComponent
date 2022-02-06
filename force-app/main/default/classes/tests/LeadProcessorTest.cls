@isTest 
public class LeadProcessorTest {
    @isTest
    public static void leadProcessorTest() {
        List<Lead> lsLeads = new List<Lead>();
        for(Integer i=0 ;i <200;i++)
        {
            Lead led = new Lead();
            led.FirstName ='FirstName';
            led.LastName ='LastName'+i;
            led.Company ='Company'+i;
            lsLeads.add(led);
        }
        
        insert lsLeads;
        
        Test.startTest();

            LeadProcessor obj = new LeadProcessor();
            DataBase.executeBatch(obj); 
            
        Test.stopTest();
    }
}