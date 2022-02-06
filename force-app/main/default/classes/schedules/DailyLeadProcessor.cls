global class DailyLeadProcessor implements Schedulable {
    
    global void execute(SchedulableContext ctx){

        /**
         * El método de execute debe encontrar los primeros 200 registros Lead con un campo LeadSource 
         * en blanco y actualizarlos con el valor LeadSource de Dreamforce
         */

        List<Lead> lstLeads = [
            SELECT Id, LeadSource
            FROM Lead
            WHERE LeadSource = null OR LeadSource ='' ];
        
        //update
        for(Lead auxL : lstLeads){
            auxL.LeadSource = 'Dreamforce';
        }
        
        update lstLeads;

    }
}
