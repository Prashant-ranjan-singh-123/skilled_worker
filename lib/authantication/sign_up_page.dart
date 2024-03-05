import 'package:flutter/material.dart';
import 'package:v_bhartiya/authantication/country_state_city.dart';
import 'package:v_bhartiya/authantication/login_page.dart';
import 'package:get/get.dart';
import 'package:v_bhartiya/authantication/otp_page.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscureText1st = true;
  TextEditingController pass1 = TextEditingController();
  TextEditingController pass2 = TextEditingController();
  bool dontMatch=false;
  String toDisplay = '';

  void sign_up_fun(){
    StateCity().allStates();
    // StateCity().getAllCitiesInIndia();

    if (!(pass1.text == pass2.text)) {
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return Theme(
      //       data: ThemeData(canvasColor: Colors.orange),
      //       child: AlertDialog(
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.all(Radius.circular(20.0)),
      //         ),
      //         title: const Column(
      //           mainAxisAlignment: MainAxisAlignment.end,
      //           children: [
      //             Icon(
      //               Icons.warning,
      //               color: Colors.red,
      //               size: 75,
      //             ),
      //             SizedBox(width: 8),
      //             Text(
      //               'Warning',
      //               style: TextStyle(
      //                 fontWeight: FontWeight.w900,
      //                 fontFamily: 'Roboto',
      //               ),
      //             ),
      //           ],
      //         ),
      //         content: const Text('Password and Confirm Password don\'t match.'),
      //         actions: <Widget>[
      //           Card(
      //             child: TextButton(
      //               child: const Text('OK'),
      //               onPressed: () {
      //                 Navigator.of(context).pop();
      //               },
      //             ),
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // );
      dontMatch = true;
      toDisplay='Password mismatched. Retry';
      setState(() {});
    }else if(pass1.text.length<8) {
      dontMatch = true;
      toDisplay='Password should be at-least 7 character';
      setState(() {});
      // Fluttertoast.showToast(
      //   msg: 'Password should be at-least 7 character',
      //   toastLength: Toast.LENGTH_SHORT, // Duration for which the toast should be visible
      //   gravity: ToastGravity.BOTTOM, // Position of the toast message
      //   backgroundColor: Colors.black54, // Background color of the toast message
      //   textColor: Colors.white, // Text color of the toast message
      //   fontSize: 16.0, // Font size of the toast message
      // );
    }else{
      Get.off(const Otp());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0, left: 22),
                child: Text(
                  'Create Your\nAccount',
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Roboto',
                      color: Theme.of(context).colorScheme.background,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                  color: Theme.of(context).colorScheme.background,
                ),
                height: double.infinity,
                width: double.infinity,
                child:  Padding(
                  padding: const EdgeInsets.only(left: 18.0,right: 18, top: 33),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.location_history_rounded,color: Theme.of(context).colorScheme.onSecondary,),
                              hintText: 'ex: Rohan Singh',
                              hintStyle: const TextStyle(
                                  color:Colors.black45,
                                  fontFamily: 'Roboto'
                              ),
                              label: const Text('Full Name',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:Colors.black,
                                fontFamily: 'Roboto'
                              ),)
                          ),
                        ),
                        const TextField(
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.location_on,color: Colors.grey,),
                              label: Text('State',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:Colors.black87,
                              ),)
                          ),
                        ),
                        const TextField(
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.location_city,color: Colors.grey,),
                              label: Text('City',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:Colors.black87,
                              ),)
                          ),
                        ),
                        const TextField(
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.pin,color: Colors.grey,),
                              label: Text('Pin Code',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:Colors.black87,
                              ),)
                          ),
                        ),
                        const TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.phone_android,color: Colors.grey,),
                              hintText: 'ex: 7967482039',
                              hintStyle: TextStyle(
                                  color:Colors.black45,
                                  fontFamily: 'Roboto'
                              ),
                              label: Text('Phone Number',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:Colors.black87,
                              ),)
                          ),
                        ),
                    if (dontMatch) TextField(
                      obscureText: _obscureText1st,
                      controller: pass1,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: _obscureText1st
                              ? const Icon(Icons.visibility_off, color: Colors.grey)
                              : const Icon(Icons.visibility, color: Colors.grey),
                          onPressed: () {
                            setState(() {
                              _obscureText1st = !_obscureText1st;
                            });
                          },
                        ),
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      onChanged: (value) {
                        dontMatch=false;
                        setState(() {});
                      },
                    ) else TextField(
                      obscureText: _obscureText1st,
                      controller: pass1,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: _obscureText1st
                              ? const Icon(Icons.visibility_off, color: Colors.grey)
                              : const Icon(Icons.visibility, color: Colors.grey),
                          onPressed: () {
                            setState(() {
                              _obscureText1st = !_obscureText1st;
                            });
                          },
                        ),
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      onChanged: (value) {
                      },
                    ),
                        if (dontMatch) TextField(
                          obscureText: _obscureText1st,
                          controller: pass2,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: _obscureText1st
                                  ? const Icon(Icons.visibility_off, color: Colors.grey)
                                  : const Icon(Icons.visibility, color: Colors.grey),
                              onPressed: () {
                                setState(() {
                                  _obscureText1st = !_obscureText1st;
                                });
                              },
                            ),
                            labelText: toDisplay,
                            labelStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                          onChanged: (value) {
                            dontMatch=false;
                            setState(() {});
                          },
                        ) else TextField(
                          obscureText: _obscureText1st,
                          controller: pass2,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: _obscureText1st
                                  ? const Icon(Icons.visibility_off, color: Colors.grey)
                                  : const Icon(Icons.visibility, color: Colors.grey),
                              onPressed: () {
                                setState(() {
                                  _obscureText1st = !_obscureText1st;
                                });
                              },
                            ),
                            labelText: 'Confirm Password',
                            labelStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          onChanged: (value) {
                          },
                        ),
                    
                        const SizedBox(height: 10,),
                        const SizedBox(height: 70,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.6,
                              53,
                            ), backgroundColor: Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 0, // Remove elevation (shadow) effect
                          ),
                          onPressed: () {
                            sign_up_fun();
                          },
                          child: const Text(
                            'SIGN UP',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                        const SizedBox(height: 80,),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text("Have an account?",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey
                              ),),
                              InkWell(
                                onTap: (){
                                  Get.off(const Login(),transition: Transition.fade, duration: const Duration(seconds: 1));
                                },
                                child: const Text("Sign In",style: TextStyle(///done login page
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.black
                                ),),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}