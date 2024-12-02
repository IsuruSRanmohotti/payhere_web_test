import 'dart:js' as js;

class PaymentService {
  void initiatePayHerePayment() {
    final paymentObject = {
      "sandbox": true, 
      "merchant_id": "1226292", 
      "return_url": "https://ceylonedge.lk", 
      "cancel_url": "https://ceylonedge.lk",
            "notify_url": "https://eokwyobr35ggdi5.m.pipedream.net",

      "order_id": "Item12345",
      "items": "Sample Item", 
      "amount": "100.00",
      "currency": "LKR", 
      "first_name": "John",
      "last_name": "Doe",
      "email": "john.doe@example.com",
      "phone": "0771234567",
      "address": "No. 1, Galle Road",
      "city": "Colombo",
      "country": "Sri Lanka"
    };

    js.context.callMethod('startPayHerePayment', [paymentObject]);
  }
}
