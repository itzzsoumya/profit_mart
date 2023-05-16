
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:profit_mart/main.dart';

import 'home.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    //_navigatetohome();

    Timer(Duration(seconds: 2),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => screen()
            )
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.lightBlue.shade900,
      body: Stack(
        children: [
          Container(
            child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset('assets/economy.jpg',
                  fit: BoxFit.cover, color: Color(0814030).withOpacity(0.9), colorBlendMode: BlendMode.modulate)
            ) ,
          ),
          Container(
            child: Center(
              child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.asset('assets/logo.png',
                    fit: BoxFit.contain,)
              ),
            ) ,
          )

        ],
      )
    );
  }
}


