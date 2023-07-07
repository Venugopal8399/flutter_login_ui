import 'package:flutter/material.dart';
import 'package:flutter_login_ui/Authenticator/fire_auth.dart';
import 'package:flutter_login_ui/Page%20Transition/page_transition.dart';
import 'package:flutter_login_ui/Screens/Navigation_Bar/Home.dart';
import 'package:flutter_login_ui/Screens/Register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_ui/Validator/validator.dart';
import 'package:firebase_core/firebase_core.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
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
  void dispose() {
   _emailIdController.dispose();
   _passwordController.dispose();
    super.dispose();
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
                Form(
                  key: _formKey,
                  child: Container(
                    margin: EdgeInsets.all(25),
                    child: Expanded(
                      flex: 30,
                      child: Column(
                        children: [
                          // Email id TextField
                          TextFormField(
                             validator: (val) => Validator.validateEmail(email: _emailIdController.text.toString().trim()),
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
                            validator: (val) => Validator.validatePassword(password: _passwordController.text.toString().trim()),
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          User? user = await FireAuth.signInUsingEmailPassword(
                            email: _emailIdController.text,
                            password: _passwordController.text,
                          );
                          if (user != null) {
                            Navigator.of(context)
                                .pushReplacement(
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          }
                        }
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

