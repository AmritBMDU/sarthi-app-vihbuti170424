import 'package:flutter/material.dart';
import 'package:sarthi/app/global/appcolor.dart';
import 'package:sarthi/app/home/homepage.dart';

import 'login_ui.dart';
class OtpUi extends StatefulWidget {
  const OtpUi({Key? key}) : super(key: key);

  @override
  State<OtpUi> createState() => _OtpUiState();
}

class _OtpUiState extends State<OtpUi> {
  @override
  Widget build(BuildContext context) {

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 200,),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('OTP Authentication',style:
                          TextStyle(color: appcolor.black,fontWeight: FontWeight.bold,
                              fontSize: 30),),
                          SizedBox(height: 10,),
                          Text('An authentication code sent to',style:
                          TextStyle(
                              fontSize: 24),),

                          Text('your Phone Number',style:
                          TextStyle(color: appcolor.black,
                              fontSize: 24),),
                          SizedBox(height: 30,),
                        ],
                      ),
                    ),
                    Text('Enter OTP',style:
                    TextStyle(color: appcolor.black,
                        fontSize: 24),),
                    SizedBox(height: 10,),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Did not recive code.',style:
                              TextStyle(color: appcolor.black,
                                  fontSize: 20),),
                              TextButton(onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context)=> HomePage()));

                              }, child: Text('Resend Code',style:
                              TextStyle(color: appcolor.blue,fontWeight: FontWeight.bold,
                                  fontSize: 20),),),
                            ],
                          ),
                          SizedBox(height: 40,),
                          Row(
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Navigator.push(context, MaterialPageRoute(
                                      //     builder: (context) => OtpUi()));

                                      // if (_formKey.currentState?.validate() == true) {
                                      //   _provider.doLogin();
                                      // }
                                    },
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(color: Colors.white,fontSize:20 ),
                                    ),
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10)
                                            )
                                        ),
                                        backgroundColor:
                                        MaterialStateProperty.all(appcolor.blue)),

                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              ),
            ),
          ),


        ),
      ),
    );
  }
}
