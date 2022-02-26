@isTest
public with sharing class AnimalLocatorTest {
    @isTest 
    static  void getAnimalNameByIdTest() {

        // Associate the callout with a mock response
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        // Call method to test
        String result = AnimalLocator.getAnimalNameById(1);
        // Verify mock response is not null
        System.assertEquals('chicken', result , 'Not expected name');          
    } 


    /**NOTA: Si hubiesemos usado un static : 
     *  // Create the mock response based on a static resource
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Associate the callout with a mock response
        Test.setMock(HttpCalloutMock.class, mock);
     */
}
