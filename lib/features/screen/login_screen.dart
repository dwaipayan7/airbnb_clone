import 'package:airbnb_clone/features/screen/widgets/phone_number_field.dart';
import 'package:airbnb_clone/features/screen/widgets/social_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("Login or Sign In",
                    style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold,

                    ),),
                ),
                Divider(color: Colors.black,),
                Padding(padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text("Welcome to Airbnb",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                      ),
                      ),
                  SizedBox(height: height * 0.02),
                  phoneNumberField(),
                      SizedBox(height: height * 0.015,),
                      RichText(
                        text: const TextSpan(
                          text:
                          "We'll call or text you to conform your number."
                              " Standard message and data rates apply.  ",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              )
                            )
                          ]
                        )
                      ),

                      SizedBox(height: height * 0.03,),
                      Container(
                        width: width,
                        padding: EdgeInsets.symmetric(vertical: 12,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.pink
                        ),
                        child: Center(
                          child: Text("Continue",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                      SizedBox(height: height * 0.026,),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                                height: 1,
                                color: Colors.black26,
                              )
                          ),

                          Padding(padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Text("OR"),
                          ),

                          Expanded(
                              child: Container(
                                height: 1,
                                color: Colors.black26,
                              )
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.015,),
                      socialIcons(context, Icons.facebook, "Continue with Facebook", Colors.blue, 30),
                      InkWell(
                        onTap: (){},
                          child: socialIcons(
                              context, FontAwesomeIcons.google,
                              "Continue with Google",
                              Colors.pink,27
                          )
                      ),
                      socialIcons(context, Icons.apple, "Continue with AppleId", Colors.black, 30),
                      socialIcons(context, Icons.email_outlined, "Continue with Email", Colors.black, 30),

                    SizedBox(height: 10,),
                      Center(
                        child: Text("Need Help?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17
                        ),),
                      )

                    ],
                  ),
                )
              ],
            )
        ),
      )
    );
  }
}


