
import 'dart:_http';

import 'dart:async';

import 'dart:convert';

const apiCategory = {
  'name' : 'Currency',
   'route' : 'Currency',
};

class Api{
  final HttpClient _httpClient = HttpClient();
  final String _url = 'flutter.udacity.com';

  Future<List> getUnits(String category) async {
    final uri = Uri.https(_url, '/$category');
    final jsonResponse = await _getJson(uri);
    if(jsonResponse == null || jsonResponse['units'] == null){
      print('Error Retrieving units.');
      return null;
    }
    return jsonResponse['units'];

  }

  Future<double> convert (String category, String amount, String fromUnit,
      String toUnit) async {
    final uri = Uri.https(_url, '/$category/convert',
    {'amount' : amount, 'from': fromUnit, 'to': toUnit});
    final jsonResponse = await _getJson(uri);
    if(jsonResponse == null || jsonResponse['status'] == null){
      print('Error retrieving conversion.');
      return null;
    } else if(jsonResponse['status'] == 'error'){
      print(jsonResponse['message']);
      return null;
    }
    return jsonResponse['conversion'].toDouble();
  }

  Future<Map<String, dynamic>> _getJson(Uri uri) async {
    try{
      final httpRequest = await _httpClient.getUrl(uri);
      final httpResponse = await httpRequest.close();
      if(httpResponse.statusCode != HttpStatus.accepted){
        return null;
      }
      final responseBody = await httpResponse.transform(utf8.decoder).join();

      return json.decode(responseBody);
    } on Exception catch(e){
      print('$e');
      return null;
    }
  }
}