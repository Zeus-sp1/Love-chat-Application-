import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:love_chat/components/rounded_button.dart';
import 'package:love_chat/view/calls_page.dart';
import 'package:love_chat/view/login_screen.dart';
import 'package:love_chat/view/registration_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  bool showSpinner = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );

    animation =
        ColorTween(begin: Color.fromARGB(255, 51, 50, 50), end: Colors.pink)
            .animate(controller);

    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    // controller.reverse(from: 1.0);

    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    controller.forward();

    controller.addListener(() {
      setState(() {});
      // print(animation.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      // backgroundColor: Colors.red.withOpacity(controller.value),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Hero(
                    tag: 'love_logo.jpg',
                    child: Container(
                      child: Image.asset('images/love_logo.jpg'),
                      height: 60.0,
                    ),
                  ),
                  TypewriterAnimatedTextKit(
                    text: ['Love Chat'],
                    textStyle: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  // Text(
                  //   '${controller.value.toInt()}%',
                  //   style: TextStyle(
                  //     fontSize: 40.0,
                  //     fontWeight: FontWeight.w900,
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: 48.0,
              ),
              RoundedButton(
                title: 'Log in',
                colour: Color.fromARGB(255, 78, 42, 72),
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
              ),
              RoundedButton(
                title: 'Register',
                colour: Color.fromARGB(255, 78, 42, 72),
                onPressed: () {
                  setState(() {
                    showSpinner = true;
                  });
                  Navigator.pushNamed(context, RegistrationScreen.id);
                  setState(() {
                    showSpinner = false;
                  });
                },
              ),

              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: 16.0),
              //   child: Material(
              //     color: Colors.blueAccent,
              //     borderRadius: BorderRadius.circular(30.0),
              //     elevation: 5.0,
              //     child: MaterialButton(
              //       onPressed: () {
              //         Navigator.pushNamed(context, RegistrationScreen.id);
              //       },
              //       minWidth: 200.0,
              //       height: 42.0,
              //       child: Text(
              //         'Register',
              //       ),
              //     ),
              //   ),
              // ),
              RoundedButton(
                title: 'Test button',
                colour: Color.fromARGB(255, 78, 42, 72),
                onPressed: () {
                  setState(() {
                    showSpinner = true;
                  });
                  Navigator.pushNamed(context, CallPage.id);
                  setState(() {
                    showSpinner = false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
