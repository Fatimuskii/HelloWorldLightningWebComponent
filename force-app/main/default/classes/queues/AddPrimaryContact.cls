public class AddPrimaryContact implements Queueable {
    
    /**Cree un constructor para la clase que acepte como primer argumento un Contact sObject 
     * y como segundo argumento una cadena para la abreviatura de estado */
    private Contact contact;
    private String shortState;
    
    public AddPrimaryContact(Contact cont, String shortState) {

        this.contact= cont;
        this.shortState = shortState;
    }

    /*
    The execute method must query for a maximum of 200 Accounts with the BillingState specified 
    by the State abbreviation passed into the constructor and insert the Contact sObject record 
    associated to each Account. Look at the sObject clone() method.
     */
    public void execute(QueueableContext context) {
        List<Account> lAccounts = [
            SELECT ID, Name ,
                (SELECT Id,FirstName,LastName from contacts ) 
            FROM Account WHERE BillingState =:this.shortState 
            LIMIT 200];

        List<Contact> lContacts = new List<Contact>();
        for (Account acc:lAccounts){
                Contact cont = this.contact.clone(false,false,false,false);
                cont.AccountId =  acc.Id;
                lContacts.add(cont);
        }
        
        if(!lContacts.isEmpty()){
            insert lContacts;
        }
    }
}
