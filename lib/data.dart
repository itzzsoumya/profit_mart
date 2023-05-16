// class DataChain{
//   String title = '';
//   String icon = '';
//   String call = '';
//   String cmp='';
//   String between = '';
//   String status = '';
//   String exchange = '';
//   String target = '';
//   String value = '';
//   String days = '';
//   String sl = '';
//   String pl = '';
//   String date = '';
//   String time = '';
//   String admin = '';
//
//   DataChain(
//       {required this.title, required this.icon,
//         required this.call,required this.cmp , required this.status,
//         required this.exchange,required this.target, required this.value,
//         required this.days, required this.sl, required this.pl,
//         });
// }


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'get.dart';
import 'package:http/http.dart' as http;

class callApi{
  Future<List<Post>?>getPosts() async{
    var client=http.Client();

    var uri=Uri.parse('https://ekyc.profitmart.in:46036/notificationadmin/notificationShow?clcode=55550198&lastlogid=0&tag=0');
    var response=await client.get(uri);
    if(response.statusCode==200){
      var json = response.body;
      debugPrint(json);
      save_to_shared_pref(json);
      return postFromJson(json);
    }
  }

  Future<void> save_to_shared_pref(String json) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('notification_list', json);
  }

  Future<List<Post>?> get_from_shared_pref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jsonStr = prefs.getString('notification_list')!;
    //print('get_from_shared_pref: $jsonStr');
    return postFromJson(jsonStr);
  }
}