import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sarthi/app/global/appcolor.dart';
import 'package:sarthi/app/ui/forgot_pin.dart';
import 'package:http/http.dart' as http;
import 'package:sarthi/app/ui/sign_up.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginUi extends StatefulWidget {
  const LoginUi({Key? key}) : super(key: key);

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  Future<void> _login() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();


    // final String email = "guddu@gmail.com";
    // final String password = "12345678";
    final String url1 = 'https://qbacp.com/Sarthi-dashboard/api/login';


    try {
      final response = await http.post(
        Uri.parse(url1),
        body: jsonEncode(<String, String>{
          'email_or_mobile': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // try {
      //   final response = await http.post(
      //     Uri.parse(url1),
      //     body: jsonEncode(<String, String>{
      //       'email_or_mobile': email,
      //       'password': password,
      //     }),
      //     headers: <String, String>{
      //       'Content-Type': 'application/json; charset=UTF-8',
      //     },
      //   );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      Fluttertoast.showToast(
        msg: "Response body: ${response.body}'",
      );

      if (response.statusCode == 200) {
        // Parse the response body
        final List<dynamic> users = jsonDecode(response.body);

        // Use the 'users' list as needed
        // For example, you can print the users' names
        for (var user in users) {
          Fluttertoast.showToast(msg: 'User: ${user['name']}');
          print('User: ${user['name']}');
        }
      } else {
        print('Failed to fetch users. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    bool obscureConfirmPassword =true;
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assests/image/back.jpeg',
              ),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                child: Column( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 140,),
                  Text(
                    'SARTHI',
                    style: GoogleFonts.jost(
                      textStyle: TextStyle(
                        color: appcolor.blue, // assuming appcolor is defined somewhere
                        fontWeight: FontWeight.w800,
                        fontSize: 50,
                      ),),
                  ),
                  Text('सारथी',style:GoogleFonts.tiroDevanagariHindi( textStyle :
                  TextStyle(color: appcolor.black,
                      fontSize: 48),),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Login',style:
                      TextStyle(color: appcolor.black,
                          fontSize: 28,fontWeight: FontWeight.w500),),
                      SizedBox(height: 15,),
                      Text('Mobile Number',style:
                      TextStyle(color: appcolor.black,
                        fontSize: 14,),),
                      SizedBox(height: 5,),
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(12), // Limit to 13 characters (including +91)
                          _IndianMobileNumberFormatter(), // Format the input for Indian mobile numbers
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          hintText: "+91 Enter your phone number",hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.phone,color: Colors.grey,),

                          // prefixText: '+91 ', // Prefix with Indian country code
                        ),
                      ),
            //           TextFormField(
            // //controller: _provider.password,
            //             obscureText: false,keyboardType: TextInputType.number,
            //             maxLength: 10,
            //             decoration: InputDecoration(
            //               border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            //               hintText: "Enter your phone number",hintStyle: TextStyle(color: Colors.grey),
            //             ),
            //             validator: (value) {
            //               if (value == null || value.isEmpty == true) {
            //                 return "Password should not be empty";
            //               }
            //               return null;
            //             },
            //           ),
                      SizedBox(height: 8,),
                      Text('Password',style:
                      TextStyle(color: appcolor.black,
                        fontSize: 14,)),
                      SizedBox(height: 5,),
                      TextFormField(
                        controller: passwordController,
                        obscureText: obscureConfirmPassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),hintStyle: TextStyle(color: Colors.grey),
                          hintText: " Password",
                           prefixIcon: Icon(Icons.lock, color: Colors.grey,),
                          // Add suffix icon toggle
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                // Toggle the obscureText value
                                obscureConfirmPassword =! obscureConfirmPassword;
                              });
                            },
                            child: Icon(
                              obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty == true) {
                            return "Confirm Password should not be empty";
                          }
                          return null;
                        },
                      ),
            //           TextFormField(
            // //controller: _provider.password,
            //             obscureText: true,keyboardType: TextInputType.number,
            //             decoration: InputDecoration(
            //               border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            //               hintText: "Type Password here",
            // // labelText: "Password"
            //             ),
            //             validator: (value) {
            //               if (value == null || value.isEmpty == true) {
            //                 return "Password should not be empty";
            //               }
            //               return null;
            //             },
            //           ),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> SignUp()));


                      }, child: Text('Register with us !',style:
                      TextStyle(color: appcolor.blue,
                          fontSize: 14),),),
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPin()));

                      }, child: Text('Forgot Password ?',style:
                      TextStyle(color: appcolor.blue,
                          fontSize: 14),),),
                    ],),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => SignUp()));

            // if (_formKey.currentState?.validate() == true) {
            //   _provider.doLogin();
            // }
                            },
                            child: Text(
                              "Continue",
                              style: TextStyle(color: Colors.white,fontSize:14 ),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    )
                                ),
                                backgroundColor:
                                MaterialStateProperty.all(appcolor.blue)),
                          )),],),
                  SizedBox(height: 110,),
                  // Column(crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //   TextButton(onPressed: () {
                  //     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginUi()));
                  //   }, child: Text('Helpline No: 91 8598765443',style:
                  //   TextStyle(color: appcolor.blue,
                  //       fontSize: 18,fontWeight: FontWeight.bold),),),
                  //   TextButton(onPressed: () {
                  //     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginUi()));
                  //   }, child: Text('Email ID- deep@1234gmail.com',style:
                  //   TextStyle(color: appcolor.blue,
                  //       fontSize: 18,fontWeight: FontWeight.bold),),)
                  // ],),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Helpline No:',style:
                      TextStyle(color: appcolor.blue,
                        fontSize: 15,),),
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginUi()));
                      }, child: Text(' 91 8598765443',style:
                      TextStyle(color: appcolor.black,
                          fontSize: 18,fontWeight: FontWeight.bold),),)
                    ],),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Email ID-',style:
                      TextStyle(color: appcolor.blue,
                        fontSize: 15,),),
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginUi()));
                      }, child: Text('deep@1234gmail.com',style:
                      TextStyle(color: appcolor.black,
                          fontSize: 18,fontWeight: FontWeight.bold),),)
                    ],),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      ListTile(
                        title: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Helpline No: ',
                                style: TextStyle(color: Colors.blue),
                              ),
                              TextSpan(
                                text: '91 8598765443',
                                style: TextStyle(color: Colors.black),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => _launchPhone('+918598765443'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        title: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Email ID: ',
                                style: TextStyle(color: Colors.blue),
                              ),
                              TextSpan(
                                text: 'deep@1234gmail.com',
                                style: TextStyle(color: Colors.black),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => _launchEmail('deep@1234gmail.com'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),



                ],),


              ),
            ),
          ),
        ),
      )

    );
  }
  // Function to launch phone call
  void _launchPhone(String phoneNumber) async {
    String url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Function to launch email
  void _launchEmail(String email) async {
    String url = 'mailto:$email';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
class _IndianMobileNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // If the length of the text is 5 or 9 (excluding '+91 '), add a space
    if (newValue.text.length == 5 || newValue.text.length == 9) {
      return newValue.copyWith(
        text: '${newValue.text} ', // Add a space
        selection: TextSelection.collapsed(
          offset: newValue.selection.end + 1, // Move cursor after the added space
        ),
      );
    }
    return newValue; // Return the new value as is
  }
}
