import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                      TextFormField(
            //controller: _provider.password,
                        obscureText: false,keyboardType: TextInputType.number,maxLength: 10,
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
                      //SizedBox(height: 5,),
                      Text('Password',style:
                      TextStyle(color: appcolor.black,
                        fontSize: 14,)),
                      SizedBox(height: 5,),
                      TextFormField(
            //controller: _provider.password,
                        obscureText: true,keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
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



                ],),


              ),
            ),
          ),
        ),
      )

    );
  }
}
