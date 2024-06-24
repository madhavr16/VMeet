import 'package:flutter/material.dart';
import 'package:v_meet/resources/auth_methods.dart';
import 'package:v_meet/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Start or Join a Meeting', 
            style: TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 40),
          Image.asset('lib/assets/images/onboarding.jpg',),
          const SizedBox(height: 40),
          CustomButton(
            text: 'Google Sign In', 
            onPressed: () async{
              bool res = await _authMethods.signInWithGoogle(context);
              if(res) {
                Navigator.pushNamed(context, '/home');
              }
            }
          ),
        ]
      ),
    );
  }
}
