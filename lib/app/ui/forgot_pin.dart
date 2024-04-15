import 'package:flutter/material.dart';
import 'package:sarthi/app/global/appcolor.dart';
import 'package:sarthi/app/ui/login_ui.dart';
import 'package:sarthi/app/ui/otp.dart';
import 'package:sarthi/app/ui/sign_up.dart';

class ForgotPin extends StatefulWidget {
  const ForgotPin({Key? key}) : super(key: key);

  @override
  State<ForgotPin> createState() => _ForgotPinState();
}

class _ForgotPinState extends State<ForgotPin> {
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
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
                          Text('Forgot Password',style:
                          TextStyle(color: appcolor.blue,fontWeight: FontWeight.bold,
                              fontSize: 40),),
                          Text('Enter your Phone number to recover',style:
                          TextStyle(
                              fontSize: 24),),
                          Text('your password',style:
                          TextStyle(
                              fontSize: 24),),
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text('Phone Number',style:
                    TextStyle(color: appcolor.black,
                      fontSize: 22,),),
                    TextFormField(
                      //controller: _provider.password,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        hintText: "Enter your phone number",
                        // labelText: "Password"
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty == true) {
                          return "Password should not be empty";
                        }
                        return null;
                      },
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 20,),
                          TextButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context)=> LoginUi()));

                          }, child: Text('Back to Login',style:
                          TextStyle(color: appcolor.blue,fontWeight: FontWeight.bold,
                              fontSize: 20),),),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => OtpUi()));

                                      // if (_formKey.currentState?.validate() == true) {
                                      //   _provider.doLogin();
                                      // }
                                    },
                                    child: Text(
                                      "Send Code",
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
