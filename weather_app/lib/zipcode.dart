import 'dart:convert';

import 'package:http/http.dart';

class ZipCode {
  static Future<String> searchAddressFromZipCode(String zipCode) async {
    String url = 'https://zipcloud.ibsnet.co.jp/api/search?zipcode=$zipCode';

    try {
      var result = await get(Uri.parse(url));
      Map<String, dynamic> data = jsonDecode(result.body);

      String address = data['results'][0]['address2'];
      return address;
    } catch (e) {
      return '';
    }
  }
}
