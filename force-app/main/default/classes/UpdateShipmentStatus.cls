public class UpdateShipmentStatus {

    @future(callout=true)
    public static void updateShipmentStatus(String shipmentId, String shipmentStatus) {
        try {
            HttpRequest request = new HttpRequest();                
            request.setEndpoint('callout:OrgB_Integration/services/data/v64.0/sobjects/ShipmentRequest__c/' + shipmentId);
            request.setMethod('PATCH');
            request.setHeader('Content-Type', 'application/json');
            Map<String, String> payload = new Map<String, String>{
                'status__c' => 'Dispatched'
            };
            
            request.setBody(JSON.serialize(payload));
            
            Http http = new Http();
            HttpResponse response = http.send(request);
            
            System.debug('PATCH Response: ' + response.getBody());
        } catch (Exception e) {
            System.debug('Error in remote PATCH: ' + e.getMessage());
        }
    }
}