import 'dart:convert';
import 'dart:js' as js;

import 'package:crypto/crypto.dart';

class PaymentService {
  void initiatePayHerePayment() {
    const merchantId = "1226292";
    const orderId = "Item12345";
    const amount = "100.00";
    const currency = "LKR";
    const merchantSecret =
        "MTQ2MTczNDg5NjExNTY2NDc0MzAyMzk2ODgyMjE1NjAyMzIwODI=";

    String generateHash(String merchantId, String orderId, String amount,
        String currency, String merchantSecret) {
      final md5MerchantSecret =
          md5.convert(utf8.encode(merchantSecret)).toString().toUpperCase();
      final concatenatedString =
          merchantId + orderId + amount + currency + md5MerchantSecret;
      final hash =
          md5.convert(utf8.encode(concatenatedString)).toString().toUpperCase();
      return hash;
    }

    final hash =
        generateHash(merchantId, orderId, amount, currency, merchantSecret);

    final paymentObject = {
      "sandbox": true,
      "merchant_id": merchantId,
      "return_url": "https://ceylonedge.lk",
      "cancel_url": "https://ceylonedge.lk",
      "notify_url": "https://eokwyobr35ggdi5.m.pipedream.net",
      "order_id": orderId,
      "items": "Sample Item",
      "amount": amount,
      "currency": currency,
      "first_name": "John",
      "last_name": "Doe",
      "email": "john.doe@example.com",
      "phone": "0771234567",
      "address": "No. 1, Galle Road",
      "city": "Colombo",
      "country": "Sri Lanka",
      "hash": hash,
    };

    js.context.callMethod('startPayHerePayment', [paymentObject]);
  }
}
