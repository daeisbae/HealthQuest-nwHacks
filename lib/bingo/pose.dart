import 'package:flutter/material.dart';

import 'package:healthquest/components.dart';
import 'package:healthquest/style.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PoseDetection extends StatefulWidget {
  const PoseDetection({Key? key}) : super(key: key);

  @override
  _PoseDetectionState createState() => _PoseDetectionState();
}

class _PoseDetectionState extends State<PoseDetection> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
  }

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
      child: WebView(
        initialUrl: 'https://flutter.dev',
      ),
    );
  }
}
