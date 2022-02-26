public with sharing class AnimalLocator {
    public static String getAnimalNameById(Integer Id) {

        String nameAnimal; 
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + Id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        if(response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            Map<String, Object> animal = (Map<String, Object>) results.get('animal');
            if(animal != null){
                System.debug('Received the following animal info: '+ animal);
                nameAnimal = (String) animal.get('name');
            }
            
        }

        return nameAnimal;
    }

}
