@isTest
private class DailyLeadProcessorTest {
    
    // Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';

    static testmethod void testScheduledJob() {
        /* En la clase de prueba, inserte 200 registros Lead, programe la clase DailyLeadProcessor para ejecutar y pruebe que todos 
        los registros Lead se hayan actualizado correctamente. */

        List<Lead> listLeads = new List<Lead>(); 
        for (Integer i=0; i<200; i++) {
            Lead le = new Lead(
                FirstName = 'TestName' +i, 
                LastName= 'Last name '+ i,
                Company= 'Company'+i
            );
            listLeads.add(le);
        }

        insert listLeads;

        Map<Id, Lead> mLeadsById = new Map<Id, Lead>(listLeads);
        List<Id> listIds = new List<Id>(mLeadsById.keySet());

        Test.startTest();

        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
        CRON_EXP,
        new DailyLeadProcessor());
        // Verify the scheduled job has not run yet.
        List<Lead> lt = [SELECT Id
            FROM Lead
            WHERE LeadSource IN :listIds];
        System.assertEquals(0, lt.size(), 'Leads exist with leadSource before job has run');
        // Stopping the test will run the job synchronously
        
        Test.stopTest();
    
        // Now the job has executed,
        // check that our leads has the correct leadsource
        lt = [SELECT Id
            FROM Lead
            WHERE Id IN :listIds];

        System.assertEquals(listIds.size(),
            lt.size(),
            'Leadsource were not filled properly');
    }

}
