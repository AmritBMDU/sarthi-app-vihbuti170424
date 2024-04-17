import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                              fontSize: 28),),
                          SizedBox(height: 10,),
                          Text('Enter your Phone number to recover \n                   your password',
                            style: TextStyle(
                              fontSize: 16),),

                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text('Phone Number',style:
                    TextStyle(color: appcolor.black,
                      fontSize: 14,),),
                    SizedBox(height: 5,),
                    TextField(
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(12), // Limit to 13 characters (including +91)
                        _IndianMobileNumberFormatter(), // Format the input for Indian mobile numbers
                      ],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        hintText: "+91 Enter your phone number",hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(color: Colors.grey,Icons.phone),

                        // prefixText: '+91 ', // Prefix with Indian country code
                      ),
                    ),
                    // TextFormField(
                    //   //controller: _provider.password,
                    //   obscureText: false,
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    //     hintText: "Enter your phone number",
                    //     // labelText: "Password"
                    //   ),
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty == true) {
                    //       return "Password should not be empty";
                    //     }
                    //     return null;
                    //   },
                    // ),
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
                              fontSize: 14),),),
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
