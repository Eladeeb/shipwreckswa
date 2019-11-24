import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:shipwreckswa/models/zone.dart';
import 'dart:convert';
import 'package:shipwreckswa/util/api_util.dart';
class Zones{
  Future<List<Zone>> getZones() async{
    List<Zone> zones =[];
    var response = await http.get(ApiUtil.API_ENDPOINT);
    if(response.statusCode == 200)
      {
        var body = jsonDecode(response.body);

        var data =body['data'];
        for(var item in data)
        {
          zones.add(
              Zone.fromJson(item)
          );
        }
      }

    return  zones;
  }
}