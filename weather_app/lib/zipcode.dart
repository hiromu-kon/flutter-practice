import 'dart:convert';

import 'package:http/http.dart';

class ZipCode {
  static Future<Map<String, String>> searchAddressFromZipCode(
      String zipCode) async {
    String url = 'https://zipcloud.ibsnet.co.jp/api/search?zipcode=$zipCode';

    Map<String, String> response = {};

    try {
      var result = await get(Uri.parse(url));
      Map<String, dynamic> data = jsonDecode(result.body);

      if (data['message'] != null) {
        response['message'] = data['message'];
      } else if (data['results'] == null) {
        response['message'] = '正しい郵便番号を入力してください';
      } else {
        response['address'] = data['results'][0]['address2'];
      }

      return response;
    } catch (e) {
      return response;
    }
  }
}
