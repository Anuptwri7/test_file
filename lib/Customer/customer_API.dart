import 'dart:convert';
import 'dart:developer';
import 'package:easycare/Customer/customer_list.dart';
import 'package:flutter/foundation.dart';
import "package:http/http.dart" as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomerServices {
  Future fetchApiFromUrl() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final response = await http.get(
        Uri.parse(
            "https://api-soori-ims-staging.dipendranath.com.np/api/v1/chalan-app/customer-list"),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${sharedPreferences.get("access_token")}'
        }
        );

    if (kDebugMode) {
      // log("response ${json.decode(response.body)['results']}");
      // log("Json Item Status Code is ${json.decode(response.body)['results']}");
       // log("Json Item Status Code is${(response.body)} }");
        log("Some json decoding: ${(jsonDecode(response.body)['results'])}");
    }

    List<dynamic> resp = (jsonDecode(response.body)['results']);
    log('hello$resp');
    List<dynamic> data = resp;

   // List<Object> respond = data;


    //List<Object> Lis = respond.addAll(data);
    //  List<int> res = [];
    if (kDebugMode) {

      // log("Json Item Status Code is ${json.decode(response.body)['results']}");
      // log("Json Item Status Code is ${json.decode(response.body)}");

    }

    // log("Json Item Status Code is ${json.decode(response.body)['results']}");
    //  res.add(json.decode(response.body)['results'][i]['id']);

    if (response.statusCode == 200) {
      /*if (kDebugMode) {
        log("res ${(data)}");
      }*/
      return data;
    }
  }
}
