import 'package:flutter/material.dart';
import 'package:flutter_google_signin/reusable_widgets/reusable_widget.dart';

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




                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
