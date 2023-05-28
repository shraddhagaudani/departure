import 'package:flutter/material.dart';

class Splashscreen_page extends StatefulWidget {
  const Splashscreen_page({Key? key}) : super(key: key);

  @override
  State<Splashscreen_page> createState() => _Splashscreen_pageState();
}

class _Splashscreen_pageState extends State<Splashscreen_page> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 5,),
      () => Navigator.of(context).pushReplacementNamed('/'),
    );
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 300,
              width: 300,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Shikshapatri",
              style: TextStyle(
                color: Color(0xff820000),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
