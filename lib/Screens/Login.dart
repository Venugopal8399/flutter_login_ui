import 'package:flutter/material.dart';
import 'package:flutter_login_ui/Page%20Transition/page_transition.dart';
import 'package:flutter_login_ui/Screens/Navigation_Bar/Home.dart';
import 'package:flutter_login_ui/Screens/Register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passwordVisible = false;
  String errorMessage = '';
  String successMessage = '';
  final _emailIdController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 60),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.14),
                    child: Column(
                      children: [
                        Text(
                          'SET',
                          style: TextStyle(
                            fontSize: 48,
                            color: Colors.black,
                            fontFamily: 'NEW YORK',
                          ),
                        ),
                        Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    margin: EdgeInsets.all(25),
                    child: Expanded(
                      flex: 30,
                      child: Column(
                        children: [
                          // Email id TextField
                          TextFormField(
                             validator: (val) => val!.isEmpty ? 'E-Mail can\'t be empty.' : null,
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailIdController,
                            decoration: InputDecoration(
                                hintText: 'Email id',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // Password Text Form Field
                          TextFormField(
                            validator: (val) => val!.isEmpty ? 'Password can\'t be empty.' : null,
                            keyboardType: TextInputType.visiblePassword,
                            controller: _passwordController,
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              suffixIcon: IconButton(
                                icon: Icon(passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(
                                    () {
                                      passwordVisible = !passwordVisible;
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          //  Button
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.6, top: MediaQuery.of(context).size.height*0.045),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),padding: EdgeInsets.all(26),
                          primary: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(context, PageTransition(child: Home()));
                      }, child: Text('Sign In',style: TextStyle(
                      color: Colors.white,fontFamily: 'Rubik',
                  ),)),
                ),
                Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.17),
                  margin: EdgeInsets.only(top: 30,left: 30,right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: () {
                        Navigator.push(context, PageTransition(child: Register()));
                      }, child: Text('Create Account',style: TextStyle(
                        fontFamily: 'Rubik',fontSize: 15,color: Colors.black,decoration: TextDecoration.underline,
                      ),)),
                      TextButton(onPressed: () {}, child: Text('Forget Password?',style: TextStyle(
                        fontFamily: 'Rubik',fontSize: 15,color: Colors.black,decoration: TextDecoration.underline,
                      ),)),
                    ],
                  ),
                ),
                Text('Copyright©. Sumana Embedded Technologies.')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

