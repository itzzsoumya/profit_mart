import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profit_mart/product.dart';
import 'package:profit_mart/report.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home.dart';
import 'home_main.dart';

class about extends StatefulWidget {
  const about({Key? key}) : super(key: key);

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
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
                padding: const EdgeInsets.only(top: 15),
                child: Text('About Us', style: TextStyle(color: Colors.white,
                    fontSize: 26,fontWeight: FontWeight.w400),),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              

              SizedBox(height: MediaQuery.of(context).size.height*0.07,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onPrimary: Colors.white,
                  elevation: 20,
                  side: const BorderSide(
                  width: 2.0,
                  color: Colors.green,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),),
                  minimumSize: Size(50, 40),
                ),
                onPressed: () {},
                child: Text('Get in touch', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/call_green.png', width: 40, height: 30,),

                  GestureDetector(
                    onTap: () => _launchPhoneCall(),
                    child: Text('020 49119119 ', style: TextStyle(color: Colors.white,
                          fontSize: 14,fontWeight: FontWeight.w400),),
                      ),


                  // Text('020 49119119 ', style: TextStyle(color: Colors.white,
                  //     fontSize: 14,fontWeight: FontWeight.w400),),

                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.01,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/mail.png', width: 40, height: 30,),

                  GestureDetector(
                    onTap: () => _launchEmail(),
                    child: Text('support@profitmart.in ', style: TextStyle(color: Colors.white,
                      fontSize: 14,fontWeight: FontWeight.w400),),
                    ),

                  // Text('support@profitmart.in ', style: TextStyle(color: Colors.white,
                  //     fontSize: 14,fontWeight: FontWeight.w400),),

                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.02,),


              Row (
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.45,
                    width: MediaQuery.of(context).size.width*0.93,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 3,
                            color: Colors.green
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 6, 0, 2),
                          child: Text('PROFITMART is a premier Broking house offering diversified investment options like '
                              'Equities,Derivatives,Currency,Commodities,IPO,Mutual Funds and Real Estate.'
                              'At PROFITMART, we focus on delivering efficient trading software, supported with effective investing tools, which '
                              'are helpful to maximize your profits. we have been hard at work creating an investment experience to achieve your financial goals'
                              'It is our passion to offer you the best Product, Technology & Service. We ensure the trading experience at '
                              'PROFITMART to be one of its kind,with the help of our expertise.' ,
                            style: TextStyle(color: Colors.white,fontSize: 14),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 6, 0, 2),
                          child: Text('You deserve a better way to invest. We aim to deliver it.' ,
                            style: TextStyle(color: Colors.white,fontSize: 14),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Powered by   ', style: TextStyle(color: Colors.white,
                      fontSize: 14,fontWeight: FontWeight.w400),),
                  Image.asset('assets/xtremesoftlogo.png', width: 120, height: 110,)
                ],
              ),
            ],
          )
        ],
      ),



    );
  }
}


void _launchPhoneCall() async {
  final Uri params = Uri(
    scheme: 'tel',
    path: '020 49119119',
  );

  String url = params.toString();

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _launchEmail() async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: 'support@profitmart.in',
   // query: 'subject=Hello%20World&body=This%20is%20a%20test',
  );

  String url = params.toString();

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}



