import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class SmsService extends GetxService {
  final String apiKey = '79e5184cb93822d1';
  final String secretKey = 'NjI1YTUxMGEwZWQwYjYzOTFmOTljNmFiNTBjZDg0M2EzODdmN2U3MWY1MmJhYTExMzhiYTlkZDNiNmEzYjg2Zg';
  final String contentType = 'application/json';
  final String authorization = 'Basic ZWY3OTRlZGNiNzA2MzhhZDpOR1pqT1RRMk9Ea3lObUV4WTJJNE5EWTBNVEEwWXpoaU5tWmxPRE5qT1dFeVptSmtPREprTkRFM1pEVmpZbVkyTTJSa09UWmxORFkyWkRrME9HRm1NZz09';

  Future<bool> sendSms(String message, List<String> phoneNumbers) async {
    var headers = {
      'api_key': apiKey,
      'secret_key': secretKey,
      'Content-Type': contentType,
      'Authorization': authorization,
    };

    var request = http.Request('POST', Uri.parse('https://apisms.beem.africa/v1/send'));
    request.body = json.encode({
      "source_addr": "INFO",
      "schedule_time": "",
      "encoding": "0",
      "message": message,
      "recipients": phoneNumbers.asMap().entries.map((entry) {
        return {
          "recipient_id": entry.key + 1,
          "dest_addr": entry.value,
        };
      }).toList(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }
}
