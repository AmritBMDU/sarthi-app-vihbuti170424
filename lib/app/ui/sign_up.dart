import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sarthi/app/global/appcolor.dart';
import 'package:sarthi/app/ui/forgot_pin.dart';
import 'package:sarthi/app/ui/login_ui.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = '';
  bool isLoading = false;
  final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
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
                    IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginUi()));
                    }, icon: Icon(Icons.arrow_back_ios_rounded,color: appcolor.black)),
                    SizedBox(height: 60),
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
                      controller: nameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          hintText: "Deepak",hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.person,color: Colors.grey,

                        )
                          ),
                      validator: (name){
                        if(name!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(name!)){
                          return "Enter correct name";
                        }else{
                          return null;}
                    },

                      // validator: (username) {
                      //   if (username == null || username.isEmpty == true) {
                      //     return "Name should not be empty";
                      //   }
                      //   return null;
                      // },
                    ),
                    SizedBox(height: 10,),
                    Text('Phone Number',style:
                    TextStyle(color: appcolor.black,
                      fontSize: 14,),),
                    SizedBox(height: 4,),
                    TextField(
                      controller: mobileController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(12), // Limit to 13 characters (including +91)
                        _IndianMobileNumberFormatter(), // Format the input for Indian mobile numbers
                      ],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        hintText: "+91 Enter your phone number",hintStyle: TextStyle(color: Colors.grey),
                        // prefixText: '+91 ',
                        prefixIcon: Icon(Icons.phone,color: Colors.grey,),
                      ),
                    ),
                    // TextFormField(
                    //   //controller: _provider.username,
                    //   keyboardType: TextInputType.number,maxLength: 10,
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    //     hintText: "+919990007778",hintStyle: TextStyle(color: Colors.grey),
                    //   ),
                    //     validator: (number){
                    //       if(number!.isEmpty ||
                    //           !RegExp(r'^[+]*[(]{0,1}[0-9}{1,4}[)]{0,1}[-\s\,/0-9]+$').hasMatch(number!)){
                    //         return "Enter correct phone number";
                    //       }else{
                    //         return null;}
                    //     },
                    // ),
                    // SizedBox(height: 5,),
                    Text('Email ID',style:
                    TextStyle(color: appcolor.black,
                      fontSize: 14,),),
                    SizedBox(height: 4,),
                    TextFormField(
                      controller: emailController,
                     // controller: _provider.username,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          hintText: "example@gmail.com",hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.email,color: Colors.grey,)
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
                      controller: passwordController,
                      //controller: _provider.password,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "@12345678",hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(color: Colors.grey,Icons.lock)
                        // labelText: "Password"
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty == true) {
                          return "Password should not be empty";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                    Text('Confirm Password', style: TextStyle(color: appcolor.black, fontSize: 14)),
                    SizedBox(height: 4,),
                    TextFormField(
                      //controller: _provider.password,

                      obscureText: _obscureConfirmPassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Confirm Password",hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(color: Colors.grey,Icons.lock),
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
                        fontSize: 26,fontWeight: FontWeight.bold),),)
                    ],),






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
