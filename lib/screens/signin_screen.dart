import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_signin/reusable_widgets/reusable_widget.dart';
import 'package:flutter_google_signin/screens/home_screen.dart';
import 'package:flutter_google_signin/screens/reset_password.dart';
import 'package:flutter_google_signin/screens/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFCB2B93), Color(0xFF9546C4), Color(0xFF5E61F4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          
          //alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                20,
                MediaQuery.of(context).size.height * 0.1,
                20,
                0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                
                children: [
                  Image.asset(
                    "assets/images/icon1.png",
                    fit: BoxFit.fitWidth,
                    width: 400,
                    height: 400,
                    color: Colors.white,
                  ),

                  const SizedBox(height: 30,),
                  reusableTextField("Enter your Mail", Icons.person_2_outlined, false, _emailTextController),
                  const SizedBox(height: 30,),
                  reusableTextField("Enter Password", Icons.lock, true, _passwordTextController),


                   const SizedBox(height: 30,),
                    forgetPassword(context),
                firebaseUIButton(context, "Sign In", () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage(title: 'scdcs',)));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),

                   signUpOption(),

                   



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
   Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
