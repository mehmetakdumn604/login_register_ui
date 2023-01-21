import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  StateMachineController? controller;

  SMIInput<bool>? isChecking;
  SMIInput<bool>? isHandsUp;
  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFail;
//
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffD6E2EA),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //rive animation
              SizedBox(
                width: size.width,
                height: 200,
                child: RiveAnimation.asset(
                  "images/animated_login_character.riv",
                  stateMachines: const ["Login Machine"],
                  onInit: (artboard) {
                    controller = StateMachineController.fromArtboard(artboard, "Login Machine");
                    if (controller == null) return;

                    artboard.addController(controller!);
                    isChecking = controller?.findInput("isChecking");
                    isHandsUp = controller?.findInput("isHandsUp");
                    trigSuccess = controller?.findInput("trigSuccess");
                    trigFail = controller?.findInput("trigFail");
                  },
                ),
              ),

              const SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  if (isHandsUp != null) {
                    isHandsUp!.change(false);
                  }
                  if (isChecking == null) return;

                  isChecking!.change(true);
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "E mail",
                  prefixIcon: const Icon(Icons.mail),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  if (isChecking != null) {
                    isChecking!.change(false);
                  }
                  if (isHandsUp == null) return;

                  isHandsUp!.change(true);
                },
                obscureText: true, // to hide password
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              SizedBox(
                width: size.width,
                child: const Text(
                  "Forgot your password?",
                  textAlign: TextAlign.right,
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
              const SizedBox(height: 10),
              MaterialButton(
                minWidth: size.width,
                height: 50,
                color: Colors.purple,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                onPressed: () {
                  // todo login
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't you have an account?"),
                    TextButton(
                      onPressed: () {
                        // todo register
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
