@RestResource(urlMapping='/CarrierAPI/*')
global with sharing class CarrierAPI {

    // GET all records
    @HttpGet
    global static String doGet() {
        return 'Reached';
    }

    global class RequestWrapper {
        public String shipmentId;
        public String destination;
        public String status;
    }

    @HttpPost
    global static String doPost() {
        RestRequest req = RestContext.request;
        RequestWrapper input = (RequestWrapper) JSON.deserialize(req.requestBody.toString(), RequestWrapper.class);

        UpdateShipmentStatus.updateShipmentStatus(input.shipmentId, 'Testing');
        return 'Success';
    }
}