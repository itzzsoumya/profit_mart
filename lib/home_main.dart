import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:profit_mart/home.dart';
import 'package:profit_mart/product.dart';
import 'package:profit_mart/report.dart';
import 'package:profit_mart/retrofit/apis.dart';
import 'package:profit_mart/retrofit/app_repository.dart';
import 'package:profit_mart/test.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'about.dart';
import 'data.dart';
import 'get.dart';

class homeMain extends StatefulWidget {
  const homeMain({Key? key}) : super(key: key);

  @override
  State<homeMain> createState() => _homeMainState();
}

class _homeMainState extends State<homeMain> {
  bool callCheckboxChecked = false;
  bool exchangeCheckBoxChecked = false;
  bool isTopVisible = false;

  String dropdownValue = 'Intraday';
  String drpEx = 'NSE';
  late SharedPreferences prefs;
  late String selectVal;

  List<Post>? posts = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await callApi().getPosts();
    if (posts != null) {
      //save_to_shared_pref(posts!);
      setState(() {
        print(posts?.length);
      });
    }
  }

  getDataFromSharePref(bool hasRemovedFilter) async {
    posts?.clear();
    setState(() {
    });

    if(hasRemovedFilter){
      List<Post>? p = await callApi().get_from_shared_pref();
      setState(() {
        posts = p;
      });
      // List<Post>? q = await callApi().get_from_shared_pref();
      // setState(() {
      //   posts = q;
      // });
    }else{
      List<Post>?   p = await callApi().get_from_shared_pref();
      List<Post>? temp = [];

      // List<Post>?   q = await callApi().get_from_shared_pref();
      // List<Post>? temp2 = [];
    if(callCheckboxChecked && exchangeCheckBoxChecked){
    p?.forEach((element) {
    if(element.call == dropdownValue && element.exchange == drpEx){
    temp.add(element);
    }
    });
    }
      else if(callCheckboxChecked){
        p?.forEach((element) {
          if(element.call == dropdownValue){
            temp.add(element);
          }
        });
     }

      else if(exchangeCheckBoxChecked){
        p?.forEach((element) {
          if(element.exchange == drpEx){
            temp.add(element);
          }
        });
     }



      setState(() {
       posts?.addAll(temp);
       //posts?.addAll(temp2);
      });
    }
  }

  Future<void> save_to_shared_pref(List<Post> post) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString('notification_list', post.toString());
    //posts= prefs.getString('notification_list')!;
  }

  Future<void> get_from_shared_pref() async {
    posts = prefs.getString('notification_list')! as List<Post>;
    print("check111 :${posts![0].msg}");
  }

  List<Post> postFromJson(String str) {
    print("RRR nEW : ${List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)))}");
    return List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: CupertinoColors.black,
            centerTitle: true,
            title: Image.asset('assets/logo.png', height: 50),
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isTopVisible = !isTopVisible;
                  });
                },
                icon: Icon(Icons.line_weight),
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.2,
                  color: Colors.green.shade800,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Image.asset(
                          'assets/logo.png',
                          width: double.infinity,
                        ),
                        Text(
                          "Client Code: 5555555",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => homeMain()),
                    );
                  },
                ),
                Container(
                  height: 0.5,
                  width: double.infinity,
                  color: Colors.black87,
                ),
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text("Past Performance"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.folder),
                  title: Text("Product"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => product()),
                    );
                  },
                ),
                Container(
                  height: 0.5,
                  width: double.infinity,
                  color: Colors.black87,
                ),
                ListTile(
                  leading: Icon(Icons.score),
                  title: Text("IPO Apply"),
                  onTap: () {
                    launchUrl(
                        Uri.parse("https://ekyc.profitmart.in:46036/NseIPO1/"));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.perm_contact_cal),
                  title: Text("EKYC"),
                  onTap: () {
                    launchUrl(Uri.parse(
                        "https://ekyc.profitmart.in:8000/index.aspx"));
                  },
                ),
                Container(
                  height: 0.5,
                  width: double.infinity,
                  color: Colors.black87,
                ),
                ListTile(
                  leading: Icon(Icons.event_note_sharp),
                  title: Text("Reports"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => report()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help_outline),
                  title: Text("About Us"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => about()),
                    );
                  },
                ),
                Container(
                  height: 0.5,
                  width: double.infinity,
                  color: Colors.black87,
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app_outlined),
                  title: Text("Exit"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => screen()),
                    );
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.086,
                ),
                Container(
                    height: 60,
                    width: double.infinity,
                    color: Colors.green.shade800,
                    child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                              title: const Text(
                                "LogOut",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ))),
              ],
            ),
          ),
          bottomSheet: Container(
            height: 35,
            width: double.infinity,
            color: CupertinoColors.label,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Center(
                child: Text(
                  'Disclaimer & Disclosure',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              Visibility(
                visible: isTopVisible,
                child: Container(
                  height: 140,
                  width: double.infinity,
                  color: CupertinoColors.black,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.disabled)) {
                                    return Colors.green.withOpacity(.32);
                                  }
                                  return Colors.green;
                                }),
                                value: callCheckboxChecked,
                                onChanged: (value) {
                                  setState(() {
                                    callCheckboxChecked = value!;
                                  });
                                },
                              ),
                              const Text(
                                'CALL :',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.24),
                              Container(
                                  height: 30,
                                  width: 155,
                                  padding: EdgeInsets.only(left: 5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.green)),
                                  child: DropdownButton<String>(
                                    value: dropdownValue,
                                    //icon: const Icon(Icons.arrow_downward),
                                    iconSize: 20,
                                    underline: SizedBox(),
                                    iconEnabledColor: Colors.green,
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Colors.green, fontSize: 18),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue = newValue!;
                                      });
                                    },
                                    items: <String>[
                                      'Intraday',
                                      'BTST',
                                      'Option strategy',
                                      'Delivery',
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.disabled)) {
                                    return Colors.green.withOpacity(.32);
                                  }
                                  return Colors.green;
                                }),
                                value: exchangeCheckBoxChecked,
                                onChanged: (value2) {
                                  setState(() {
                                    exchangeCheckBoxChecked = value2!;
                                  });
                                },
                              ),
                              const Text(
                                'EXCHANGE :',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.12),
                              Container(
                                  height: 30,
                                  width: 155,
                                  padding: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.green)),
                                  child: DropdownButton<String>(
                                    value: drpEx,
                                    //icon: const Icon(Icons.arrow_downward),
                                    iconSize: 24,
                                    iconEnabledColor: Colors.green,
                                    underline: SizedBox(),
                                    elevation: 16,
                                    style:  const TextStyle(
                                        color: Colors.green, fontSize: 18),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        drpEx = newValue!;
                                      });
                                    },
                                    items: <String>[
                                      'NSE',
                                      'FNO',
                                      'CDS',
                                      'MCX',
                                    ].map<DropdownMenuItem<String>>(
                                        (String value2) {
                                      return DropdownMenuItem<String>(
                                        value: value2,
                                        child: Text(value2),
                                      );
                                    }).toList(),
                                  )),
                            ],
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          Row(
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2),
                              Container(
                                height: 30,
                                width: 90,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      getDataFromSharePref(false);
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      foregroundColor: Colors.black,
                                      elevation: 0,
                                      side: const BorderSide(
                                        width: 1.0,
                                        color: Colors.green,
                                      )),
                                  child: const Text(
                                    'FILTER',
                                    style: TextStyle(
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.059),
                              Container(
                                height: 31,
                                width: 160,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                // decoration: BoxDecoration(
                                //     border: Border.all(width: 2, color: Colors.green)),
                                child: ElevatedButton(
                                  onPressed: () {
                                    getDataFromSharePref(true);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      foregroundColor: Colors.black,
                                      elevation: 0,
                                      side: const BorderSide(
                                        width: 1.0,
                                        color: Colors.green,
                                      )),
                                  child: const Text(
                                    'REMOVE FILTER',
                                    style: TextStyle(
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: posts?.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 215,
                      width: double.infinity,
                      child: Card(
                        child: Stack(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 100, top: 5),
                                child: Text(
                                  posts![index].msg.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Container(
                                            height: 55,
                                            width: 54,
                                            decoration: BoxDecoration(
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(50)),
                                              color: posts![index]
                                                          .buysell
                                                          .toString() ==
                                                      'Buy'
                                                  ? Colors.lime
                                                  : Colors.red,
                                              //color: Colors.green
                                            ),
                                            child: Center(
                                              child: Text(
                                                posts![index]
                                                    .buysell
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Row(
                                            children: const [
                                              Text(
                                                'CALL',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                posts![index].call.toString(),
                                                style: TextStyle(fontSize: 17),
                                              )),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Row(
                                            children: const [
                                              Text(
                                                'CMP',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                posts![index].cmp.toString(),
                                                style: const TextStyle(fontSize: 16),
                                              )),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Row(
                                            children: const [
                                              Text(
                                                'STATUS',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Row(
                                            children: [
                                              Text(
                                                posts![index].status.toString(),
                                                style: TextStyle(fontSize: 17),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Row(
                                            children: [
                                              Text(
                                                'EXCHANGE',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Row(
                                            children: [
                                              Text(
                                                posts![index]
                                                    .exchange
                                                    .toString(),
                                                style: TextStyle(fontSize: 17),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Row(
                                            children: [
                                              Text(
                                                'TARGET',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Row(
                                            children: [
                                              Text(
                                                posts![index].target.toString(),
                                                style: TextStyle(fontSize: 17),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Row(
                                            children: [
                                              Text(
                                                'VALUE',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Row(
                                            children: [
                                              //Text(posts![Index].call.toString(), style: TextStyle(fontSize: 17),),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Row(
                                            children: [
                                              Text(
                                                'DAYS',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Row(
                                            children: [
                                              Text(
                                                posts![index].days.toString(),
                                                style: TextStyle(fontSize: 17),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Row(
                                            children: [
                                              Text(
                                                'SL',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Row(
                                            children: [
                                              Text(
                                                posts![index]
                                                    .stoploss
                                                    .toString(),
                                                style: TextStyle(fontSize: 17),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Row(
                                            children: [
                                              Text(
                                                'P&L',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Row(
                                            children: [
                                              //Text(posts![Index].call.toString(), style: TextStyle(fontSize: 17),),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 184, left: 80),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          posts![index].sendtime.toString(),
                                          style: const TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 184, left: 300),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          posts![index].researcher.toString(),
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}
