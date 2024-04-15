import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sarthi/app/global/appcolor.dart';
import 'package:sarthi/app/ui/forgot_pin.dart';
import 'package:sarthi/app/ui/sign_up.dart';

class LoginUi extends StatefulWidget {
  const LoginUi({Key? key}) : super(key: key);

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
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
                children: [
                  SizedBox(height: 70,),
                  Text('SARTHI',style:
                  TextStyle(color: appcolor.blue,fontWeight: FontWeight.bold,
                      fontSize: 80),),
                  Text('सारथी',style:
                  TextStyle(color: appcolor.black,
                      fontSize: 80),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Login',style:
                      TextStyle(color: appcolor.black,
                          fontSize: 55,fontWeight: FontWeight.w500),),
                      SizedBox(height: 15,),
                      Text('Mobile Number',style:
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
                      SizedBox(height: 15,),
                      Text('Password',style:
                      TextStyle(color: appcolor.black,
                        fontSize: 22,)),
                      TextFormField(
            //controller: _provider.password,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Type Password here",
            // labelText: "Password"
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty == true) {
                            return "Password should not be empty";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> SignUp()));


                      }, child: Text('Register with us !',style:
                      TextStyle(color: appcolor.blue,
                          fontSize: 20),),),
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPin()));

                      }, child: Text('Forgot Password ?',style:
                      TextStyle(color: appcolor.blue,
                          fontSize: 20),),),
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


                ],),


              ),
            ),
          ),
        ),
      )

    );
  }
}
