import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_ui_clone/presentation/screen/home_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  FirebaseAuth auth = FirebaseAuth.instance;
  String? email;
  String? password;
  late AnimationController animationController;
  late Animation animations;
  late Tween<double> tween;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    tween = Tween<double>(begin: 0.0, end: 1.0);
    animations = tween.animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) => email = value,
            decoration: const InputDecoration(hintText: "Email"),
          ),
          TextField(
            onChanged: (value) => password = value,
            decoration: const InputDecoration(hintText: "Password"),
          ),
          ElevatedButton(
              onPressed: () {
                auth
                    .createUserWithEmailAndPassword(
                        email: email!, password: password!)
                    .then((value) {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        const AlertDialog(content: Text("You've signed in")),
                  );
                  Future.delayed(
                    Duration(seconds: 2),
                    () {
                      Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            HomeScreen(),
                        transitionDuration: Duration(seconds: 2),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) =>
                                FadeTransition(
                          opacity: animation.drive(tween),
                          child: child,
                        ),
                      ));
                    },
                  );
                }).catchError((err) {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        const AlertDialog(content: Text("An error occured")),
                  );
                });
              },
              child: const Text("Sign In")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("If you are signed in "),
              InkWell(
                child: Text("Log In"),
              )
            ],
          )
        ],
      ),
    );
  }
}
