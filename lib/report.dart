import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profit_mart/product.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about.dart';
import 'home.dart';
import 'home_main.dart';

class report extends StatefulWidget {
  const report({Key? key}) : super(key: key);

  @override
  State<report> createState() => _reportState();
}

class _reportState extends State<report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.black,
        centerTitle: true,
        title: Image.asset('assets/logo.png', height: 50),

        actions: [

          IconButton(onPressed: () {

          }, icon: Icon(Icons.line_weight),)
        ],
      ),

      drawer: Drawer(
        child:ListView(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.2,
              color: Colors.green.shade800,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Image.asset('assets/logo.png', width: double.infinity,),
                    Text("Client Code: 5555555",style: TextStyle(fontSize: 16, color: Colors.white),),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home), title: Text("Home"),
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
              leading: Icon(Icons.notifications), title: Text("Past Performance"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.folder), title: Text("Product"),
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
              leading: Icon(Icons.score), title: Text("IPO Apply"),
              onTap: () {
                launchUrl(Uri.parse( "https://ekyc.profitmart.in:46036/NseIPO1/"));
              },
            ),
            ListTile(
              leading: Icon(Icons.perm_contact_cal), title: Text("EKYC"),
              onTap: () {
                launchUrl(Uri.parse( "https://ekyc.profitmart.in:8000/index.aspx"));
              },
            ),
            Container(
              height: 0.5,
              width: double.infinity,
              color: Colors.black87,
            ),



            ListTile(
              leading: Icon(Icons.event_note_sharp), title: Text("Reports"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => report()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.help_outline), title: Text("About Us"),
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
              leading: Icon(Icons.exit_to_app_outlined), title: Text("Exit"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => screen()),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.086,),

            Container(
                height: 60,
                width: double.infinity,
                color: Colors.green.shade800,
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.logout, color: Colors.white,), title: Text("LogOut", style: TextStyle(color: Colors.white, fontSize: 15),),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),

                      ],
                    ))
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height:35,
        width: double.infinity,
        color: CupertinoColors.label,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Center(
            child: Text('Disclaimer & Disclosure',
              style: TextStyle(fontSize: 16,color: Colors.white),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset('assets/economy.jpg',
                    fit: BoxFit.cover, color: Color(0814030).withOpacity(0.9), //Color.fromRGBO(0, 0, 0, 0.1),
                    colorBlendMode: BlendMode.modulate)
            ) ,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text('Reports', style: TextStyle(fontSize: 44, color: Colors.white),),
              )
            ],
          ),


          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.4,
                    width:  MediaQuery.of(context).size.width*0.9,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 3,
                            color: Colors.green.shade500
                        )
                    ),
                    child: ListView(
                      padding: const EdgeInsets.all(3),
                      children: <Widget>[
                        Container(
                          height: 55,
                          color: Colors.grey,
                          child: const Center(child: Text('Equity Pivot Report', style: TextStyle(color: Colors.white, fontSize: 16),)),
                        ),
                        SizedBox(height: 3,),
                        Container(
                          height: 55,
                          color: Colors.grey,
                          child: const Center(child: Text('Commodity Pivot Report', style: TextStyle(color: Colors.white, fontSize: 16),)),
                        ),
                        SizedBox(height: 3,),
                        Container(
                          height: 55,
                          color: Colors.grey,
                          child: const Center(child: Text('Weekly Market Analysis', style: TextStyle(color: Colors.white, fontSize: 16),)),
                        ),
                        SizedBox(height: 3,),
                        Container(
                          height: 55,
                          color: Colors.grey,
                          child: const Center(child: Text('Equity Market Report', style: TextStyle(color: Colors.white, fontSize: 16),)),
                        ),
                        SizedBox(height: 3,),
                        Container(
                          height: 55,
                          color: Colors.grey,
                          child: const Center(child: Text('Commodity Monthly Performance', style: TextStyle(color: Colors.white, fontSize: 16),)),
                        ),
                        SizedBox(height: 3,),
                        Container(
                          height: 55,
                          color: Colors.grey,
                          child: const Center(child: Text('Equity Weekly Performance', style: TextStyle(color: Colors.white, fontSize: 16),)),
                        ),
                        SizedBox(height: 3,),
                        Container(
                          height: 55,
                          color: Colors.grey,
                          child: const Center(child: Text('Commodity Weekly Performance', style: TextStyle(color: Colors.white, fontSize: 16),)),
                        ),
                        SizedBox(height: 3,),
                        Container(
                          height: 55,
                          color: Colors.grey,
                          child: const Center(child: Text('Weekly Stock Picks', style: TextStyle(color: Colors.white, fontSize: 16),)),
                        ),
                        SizedBox(height: 3,),

                      ],
                    ),

                  ),


                ],
              ),
            ],
          ),



        ],
      ),


    );
  }
}
