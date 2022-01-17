import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:healthquest/components.dart';
import 'package:healthquest/style.dart';

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: glassmorphismWindow(size),
      ),
    );
  }

  Container glassmorphismWindow(Size size) {
    return Container(
      width: size.width * 0.8,
      height: size.height * 0.9,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'You completed all your tasks today. Great job!',
              style: GoogleFonts.playfairDisplay(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Image(
              image: NetworkImage(
                  "https://66.media.tumblr.com/12917efcf1ce1f4f5d9403aeaa993fff/920a7ab3783d85e0-48/s500x750/27b6cfce652b8309a5c676b9e8da61a9fcfab1e7.gif"),
            ),
          ],
        ),
      ),
    );
  }
}
