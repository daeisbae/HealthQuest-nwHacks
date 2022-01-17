import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';
import 'package:healthquest/components.dart';
import 'package:healthquest/style.dart';
import 'package:just_audio/just_audio.dart';

class MeditationPage extends StatelessWidget {
  const MeditationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.center,
          child: glassmorphismWindow(size)),
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
        child: MeditationController());
  }
}

class MeditationController extends StatefulWidget {
  const MeditationController({Key? key}) : super(key: key);

  @override
  State<MeditationController> createState() => _MeditationControllerState();
}

class _MeditationControllerState extends State<MeditationController>
    with SingleTickerProviderStateMixin {
  late AudioHandler _handler;
  late Tween<double> _animation;
  late AnimationController _animatedController;
  bool isPlaying = true;
  bool clickedBtn = false;
  late Duration meditationTime;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _handler = AudioHandler();
    meditationTime = Duration(minutes: 5);
    _animation = Tween<double>(begin: 0, end: 1);
    _animatedController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (meditationTime.inSeconds == 0) {
        timer.cancel();
        _animatedController.forward();
      } else {
        setState(() {
          (isPlaying && clickedBtn)
              ? meditationTime = meditationTime - Duration(seconds: 1)
              : null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          strokeText("Meditation Time", Colors.cyan, 30),
          Column(
            children: [
              strokeText("Time Remaining", Colors.black, 30),
              Text(meditationTime.toString().split(".")[0],
                  style: TextStyle(
                      fontSize: 30,
                      color: meditationTime.inSeconds < 10
                          ? Colors.redAccent
                          : Colors.black,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          musicController(),
          // 2NextBtn(name: "Go back", nextPath: "/bingo")
        ],
      ),
    );
  }

  InkWell musicController() {
    return InkWell(
      onTap: () {
        setState(() {
          isPlaying = !isPlaying;
          clickedBtn = true;
        });
        if (isPlaying) {
          _handler.play();
          _animatedController.forward();
        } else {
          _handler.pause();
          _animatedController.reverse();
        }
      },
      child: AnimatedIcon(
          icon: AnimatedIcons.play_pause,
          size: 60,
          color: Colors.cyan,
          progress: _animation.animate(_animatedController)),
    );
  }
}

class AudioHandler extends BaseAudioHandler {
  final _player = AudioPlayer();

  AudioHandler() {
    _player.setFilePath('assets/audio/meditation.mp3');
  }

  @override
  Future<void> play() async {
    _player.play();
  }

  @override
  Future<void> pause() async {
    _player.pause();
  }

  @override
  Future<void> stop() async {
    _player.stop();
  }
}
