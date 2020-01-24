import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:bitmec/models.dart';

class VitalSignService {
  static const url = 'http://bitmec.herokuapp.com/api/consultations/vital_sign/';

  static Future<VitalSign> create(VitalSign vitalSign) async {
    final response = await http.post(url,
      body: jsonEncode(vitalSign.toJson()),
      headers: { 'Content-Type': 'application/json' },
    );

    if (response.statusCode != 201) {
      throw 'StatusCode is not 201 in VitalSignService.create method';
    }

    final body = jsonDecode(response.body);
    return VitalSign.fromJson(body);
  }
}
