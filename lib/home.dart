import 'package:flutter/material.dart';
import 'package:profit_mart/client_login.dart';
import 'package:profit_mart/home_main.dart';

import 'gust_login.dart';


class screen extends StatefulWidget {
  const screen({Key? key}) : super(key: key);

  @override
  State<screen> createState() => _screenState();
}

class _screenState extends State<screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Container(
            child: SizedBox(
                height: MediaQuery.of(context).size.height*0.64,
                width: double.infinity,
                child: Image.asset('assets/logo.png',
                  fit: BoxFit.contain,)
            ) ,
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.78,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 130,height: 45,
                      child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                        foregroundColor: Colors.white,
                    elevation: 0,
                    side: const BorderSide(
                    width: 3.0,
                    color: Colors.lightGreenAccent,
                    )
                    ),
                    onPressed: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => gust()),
                      );

                    },
                        child:
                        Text('Gust Login', style: TextStyle(fontSize: 18),
                        ),
                      )),


                  const SizedBox(width: 35),
                  SizedBox(width:130, height: 45,
                      child: ElevatedButton(style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          elevation:0,
                          side: const BorderSide(
                            width: 3.0,
                            color: Colors.lightGreenAccent,
                          )
                      ),
                        onPressed: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => client()),
                          );


                        },
                        child:
                        Text('Client Login',style: TextStyle(fontSize: 18),), )),
                ],
              ),
            ],
          )
        ],
      )
    );
  }
}

