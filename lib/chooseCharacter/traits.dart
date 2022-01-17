import 'package:flutter/material.dart';
import 'dart:math';
import 'package:healthquest/components.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TraitsSelection extends StatelessWidget {
  TraitsSelection({Key? key}) : super(key: key);
  List<double> progressPercent = [
    Random().nextDouble(),
    Random().nextDouble(),
    Random().nextDouble(),
    Random().nextDouble(),
  ];
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
      alignment: Alignment.center,
      width: size.width * 0.8,
      height: size.height * 0.9,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SelectedCharacter(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProgressBar(
                  title: "Focus",
                  percent: progressPercent[0] < 0.2 ? 0.2 : progressPercent[0],
                  color: Colors.orangeAccent),
              ProgressBar(
                  title: "Curiousity",
                  percent: progressPercent[1] < 0.2 ? 0.2 : progressPercent[1],
                  color: Colors.greenAccent),
              ProgressBar(
                  title: "Determination",
                  percent: progressPercent[2] < 0.2 ? 0.2 : progressPercent[2],
                  color: Colors.orange),
              ProgressBar(
                  title: "Energy",
                  percent: progressPercent[3] < 0.2 ? 0.2 : progressPercent[3],
                  color: Colors.purpleAccent),
              NextBtn(name: "Next", nextPath: "/bingo"),
            ],
          )
        ],
      ),
    );
  }
}

class SelectedCharacter extends StatefulWidget {
  const SelectedCharacter({Key? key}) : super(key: key);

  @override
  _SelectedCharacterState createState() => _SelectedCharacterState();
}

class _SelectedCharacterState extends State<SelectedCharacter> {
  late int index;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getIndex().then((value) {
      setState(() => index = value);
      setState(() => isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : Image.asset(
            "assets/models/model$index.gif",
            width: 400,
          );
  }

  Future<int> getIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("characterIndex")!;
  }
}
