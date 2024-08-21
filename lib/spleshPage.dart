import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'Itempage.dart';

class SpleshClass extends StatefulWidget {
  const SpleshClass({super.key});

  @override
  State<SpleshClass> createState() => _SpleshClassState();
}

class _SpleshClassState extends State<SpleshClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Image.asset(
              "assert/spleshimg/reciepy1.jpg",
              height: double.maxFinite,
              width: double.maxFinite,
              filterQuality: FilterQuality.high,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height - 80,
              width: MediaQuery.sizeOf(context).width,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Container(
                  height: 68,
                  decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xffe3a10B)),
                  child: IconButton(
                    splashColor: const Color(0xff726832),
                    highlightColor: const Color(0xff726832),
                    onPressed: () {
                      Navigator.pushReplacement(context, CupertinoPageRoute(
                        builder: (context) {
                          return ItemClass();
                        },
                      ));
                      print("let's go ");
                    },
                    icon: const Text(
                      "Let's get started",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        letterSpacing: .51,
                        color: Color(0xff12253A),
                        fontSize: 23,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height - 65,
              left: MediaQuery.sizeOf(context).width - 100,
              child: Opacity(
                opacity: 0.5,
                child: Lottie.asset(
                  "assert/Icon/lottieTap.json",
                  filterQuality: FilterQuality.high,
                  width: 70,
                  animate: true,
                  addRepaintBoundary: true,
                  repeat: true,
                  reverse: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
