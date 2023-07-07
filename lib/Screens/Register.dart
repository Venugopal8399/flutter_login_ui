import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/Authenticator/fire_auth.dart';
import 'package:flutter_login_ui/Page%20Transition/page_transition.dart';
import 'package:flutter_login_ui/Screens/Login.dart';
import 'package:flutter_login_ui/Validator/validator.dart';
import 'package:url_launcher/url_launcher.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }  bool? isChecked = false;
  bool passwordVisible = false;
  String errorMessage = '';
  String successMessage = '';
  final _nameController = TextEditingController(text: '');
  final _emailIdController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  final _confirmPasswordController = TextEditingController(text: '');
  final _phoneController = TextEditingController(text: '');
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }
  @override
  void dispose() {
    _nameController.dispose();
    _emailIdController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _confirmPasswordController.dispose();
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
                  margin: EdgeInsets.only(bottom: 60),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                             padding: EdgeInsets.only(
                                  right: MediaQuery.of(context).size.width * 0.8, top: MediaQuery.of(context).size.height*0.05),
                              child: IconButton(onPressed: (){
                                Navigator.push(context, PageTransition(child: Login()));
                              }, icon: Icon(Icons.arrow_back_ios_new_outlined)),
                            ),
                            Text(
                              'SET',
                              style: TextStyle(
                                fontSize: 48,
                                color: Colors.black,
                                fontFamily: 'NEW YORK',
                              ),
                            ),
                            Text(
                              'Register',
                              style: TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                        //  Name Text Field
                        TextFormField(
                          validator: (val) => Validator.validateName(name: _nameController.text.toString().trim()),
                          keyboardType: TextInputType.name,
                          controller: _nameController,
                          decoration: InputDecoration(
                              hintText: 'Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                          SizedBox(
                            height: 20,
                          ),

                      //Phone Number Text Form Field
                      TextFormField(
                        validator: (val) => Validator.validatePhone(number: _phoneController.text.toString().trim()),
                        keyboardType: TextInputType.phone,
                        controller: _phoneController,
                        decoration: InputDecoration(
                            hintText: 'Phone Number',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                          SizedBox(height: 20,)


                          // Email id TextField
                          ,TextFormField(
                            validator: (value) => Validator.validateEmail(email: _emailIdController.text.toString().trim()),
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
                            validator: (value) => Validator.validatePassword(password: _passwordController.text.toString().trim()),
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
                          SizedBox(
                            height: 20,
                          ),

                          // Confirm Password Text Form Field
                          TextFormField(
                            validator: (value) => Validator.validatePassword(password: _confirmPasswordController.text.toString().trim()),
                            keyboardType: TextInputType.visiblePassword,
                            controller: _confirmPasswordController,
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
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
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 26),
                      child: Checkbox(value: isChecked, checkColor: Colors.white,activeColor: Colors.black,onChanged:(newBool){
                        setState(() {
                          isChecked =newBool;
                        });
                      }),
                    ), Text('Agree'),
                    TextButton(onPressed: (){}, child:Text('Terms & Conditions', style: TextStyle( fontFamily: 'Rubik',fontSize: 15,color: Colors.black,decoration: TextDecoration.underline,),)),
                    Container(
                      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.06,),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),padding: EdgeInsets.all(26),
                            primary: Colors.black,
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              User? user = await FireAuth.registerUsingEmailPassword(
                                email: _emailIdController.text,
                                password: _passwordController.text, name: _nameController.text,
                              );
                              if (user != null) {
                                Navigator.of(context)
                                    .pushReplacement(
                                  MaterialPageRoute(builder: (context) => Login()),
                                );
                              }
                            }
                          }, child: Text('Register',style: TextStyle(
                        color: Colors.white,fontFamily: 'Rubik',
                      ),)),
                    ),
                  ],
                ),
                Container(
                  // padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.17),
                  margin: EdgeInsets.only(top: 20,left: 30,right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: _needHelp, child: Text('Need Help?',style: TextStyle(
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
  _needHelp() async{
    final Uri url = Uri.parse('https://sites.google.com/sumanaetech.com/sumanaetech');
    if(await canLaunchUrl(url)){
      await launchUrl(url);
    }
  }
}
