import 'package:flutter/material.dart';

class gust extends StatefulWidget {
  const gust({Key? key}) : super(key: key);

  @override
  State<gust> createState() => _gustState();
}

TextEditingController nameController=new TextEditingController();

class _gustState extends State<gust> {
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
            child:SizedBox(height: MediaQuery.of(context).size.height*0.3,
            child : Center(
              child: Text('Welcome Guest !!!',
                style: TextStyle(fontSize: 34, color: Colors.white, fontWeight: FontWeight.w500),),
            ),
          ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
              child: Container(
                child:SizedBox(height: MediaQuery.of(context).size.height*0.7,
                  child : Center(
                    child:TextField(
                      style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w500),

                      controller: nameController,
                      decoration: (
                      InputDecoration(
                        labelText: ('Mobile Number*'),
                        labelStyle: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w500),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightGreenAccent, width: 2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightGreenAccent, width: 2),
                          borderRadius: BorderRadius.circular(5)
                        )
                      )
                      ),

                    ),

                  ),
                ),
              ),
            ),
          ),



          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.48,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 150,height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            side: const BorderSide(
                              width: 2.0,
                              color: Colors.lightGreenAccent,
                            )
                        ),
                        onPressed: () {

                          print(nameController.text.toString()
                          );


                        },
                        child:
                        Text('Verify with OTP', style: TextStyle(fontSize: 16),
                        ),
                      )),

                ],
              ),
            ],
          )


        ],

      ),
    );
  }
}
