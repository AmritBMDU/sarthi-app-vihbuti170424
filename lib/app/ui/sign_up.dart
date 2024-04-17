import 'package:flutter/material.dart';
import 'package:sarthi/app/global/appcolor.dart';
import 'package:sarthi/app/ui/forgot_pin.dart';
import 'package:sarthi/app/ui/login_ui.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscureConfirmPassword =true;
  bool? isChecked = false;
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
                    // IconButton(onPressed: () {
                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => LoginUi()));
                    // }, icon: Icon(Icons.arrow_back_ios_rounded,color: appcolor.black)),
                    SizedBox(height: 90,),
                    Center(
                      child: Column(
                       // mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Create an Account',style:
                          TextStyle(color: appcolor.blue,fontWeight: FontWeight.bold,
                              fontSize: 28),),
                          SizedBox(height: 4,),
                          Text('Welcome Back! Please Enter Your Details',style:
                          TextStyle(
                              fontSize: 16),),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text('Name',style:
                    TextStyle(color: appcolor.black,
                      fontSize: 14,),),
                    SizedBox(height: 4,),
                    TextFormField(
                      //controller: _provider.username,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          hintText: "Deepak",
                          ),
                      validator: (username) {
                        if (username == null || username.isEmpty == true) {
                          return "Name should not be empty";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                    Text('Phone Number',style:
                    TextStyle(color: appcolor.black,
                      fontSize: 14,),),
                    SizedBox(height: 4,),
                    TextFormField(
                      //controller: _provider.username,
                      keyboardType: TextInputType.number,maxLength: 10,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        hintText: "+919990007778",
                      ),
                      validator: (username) {
                        if (username == null || username.isEmpty == true) {
                          return "Phone Number should not be empty";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 5,),
                    Text('Email ID',style:
                    TextStyle(color: appcolor.black,
                      fontSize: 14,),),
                    SizedBox(height: 4,),
                    TextFormField(
                     // controller: _provider.username,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          hintText: "example@gmail.com",
                         ),
                      validator: (username) {
                        if (username == null || username.isEmpty == true) {
                          return "Email should not be empty";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                    Text('Password',style:
                    TextStyle(color: appcolor.black,
                      fontSize: 14,),),
                    SizedBox(height: 4,),
                    TextFormField(
                      //controller: _provider.password,
                      obscureText: true,maxLength: 10,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "@12345678",
                        // labelText: "Password"
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty == true) {
                          return "Password should not be empty";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 5,),
                    Text('Confirm Password', style: TextStyle(color: appcolor.black, fontSize: 14)),
                    SizedBox(height: 4,),
                    TextFormField(
                      //controller: _provider.password,
                      maxLength: 10,
                      obscureText: _obscureConfirmPassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Confirm Password",
                        // Add suffix icon toggle
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              // Toggle the obscureText value
                              _obscureConfirmPassword =! _obscureConfirmPassword;
                            });
                          },
                          child: Icon(
                            _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
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
                    Row( mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Checkbox(value: isChecked,
                          activeColor: appcolor.blue,
                          onChanged: (newBool){
                        setState(() {
                          isChecked = newBool;
                        });
                          }),
                      Text('Term & Condition',style:
                      TextStyle(color: appcolor.blue,
                        fontSize: 16,),),

                    ],),
                    Row(
                      children: [

                        Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => ForgotPin()));


                                // if (_formKey.currentState?.validate() == true) {
                                //   _provider.doLogin();
                                // }
                              },
                              child: Text(
                                "Sign Up",
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

                            )),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text('Have an account?',style:
                      TextStyle(color: appcolor.blue,
                        fontSize: 15,),),
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginUi()));
                      }, child: Text('Login',style:
                      TextStyle(color: appcolor.blue,
                        fontSize: 15,fontWeight: FontWeight.bold),),)
                    ],)





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
