import 'package:flutter/material.dart';
import 'package:whatsapp_clone/LoginPage.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                  "Welcome to Vishwavarta" ,
                   style: TextStyle(
                     color: Colors.teal,
                     fontSize: 29,
                     fontWeight: FontWeight.w600,
                   ),
              ),
               SizedBox(
                 height: MediaQuery.of(context).size.height/9,
               ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                    text:TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                      children: [
                        TextSpan(
                          text: "Agree and continue to accept the",
                          style: TextStyle(
                              color: Colors.grey[600],
                          ),
                        ),
                        TextSpan(
                            text: "Vishwvarta Term of Service and Privacy Policy",
                            style: TextStyle(
                              color: Colors.cyan,
                            ),

                        ),
                      ],
                    ),
                ),
              ),
              SizedBox(
               height: 20,

              ),
              InkWell(
                onTap: ()
                {
                  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (builder) =>LoginPage()),
                          (route) =>false);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width-110,
                  height: 50,
                  child: Card(
                    margin: EdgeInsets.all(0),
                    elevation: 8,
                    color: Colors.greenAccent[700],
                    child: Center(
                        child: Text("AGREE AND CONTINUE",
                         style: TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.w600,
                           fontSize: 18,
                         ),
                        ),
                     ),
                  ),
                ),
              ),
              Image.asset("assets/bg.png",
              color: Colors.greenAccent[700] ,
                height: 340,
                width: 340,

                ),
            ],
          ),
        ),
      ),
    );
  }
}
