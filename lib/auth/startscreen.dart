import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:quiz/auth/googlesign.dart';
// import 'package:quiz/screens/home.dart';


class StartScreen extends StatelessWidget {
  const StartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.grey, Colors.indigo],
            begin: Alignment.bottomLeft,
            end: Alignment.topCenter,
          )),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 6,
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height,
                        maxWidth: MediaQuery.of(context).size.width),
                    padding: const EdgeInsets.all(60.0),
                    child: const Image(
                      image: AssetImage("images/Quiz-Logo.png"),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  height: 70.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black26, Colors.indigo.shade400],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft),
                    border: Border.all(
                        color: Colors.black45, style: BorderStyle.solid),
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: TextButton(
                    child: const Text(
                      "Login With G-mail",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.amber,
                      ),
                    ),
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                      provider.googleLogin();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
