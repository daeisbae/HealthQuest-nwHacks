import 'package:flutter/material.dart';
import 'package:healthquest/style.dart';

class NextBtn extends StatelessWidget {
  final String name;
  final String nextPath;
  NextBtn({Key? key, required this.name, required this.nextPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, nextPath);
        },
        child: Container(
            width: 150,
            height: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: nextBtnColor,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.25),
                    offset: Offset(0, 4))
              ],
            ),
            child: strokeText(name, white, 36)));
  }
}

class ProgressBar extends StatefulWidget {
  final Color color;
  final String title;
  final double percent;

  ProgressBar(
      {Key? key,
      required this.title,
      required this.percent,
      required this.color})
      : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  late bool isActive;
  @override
  void initState() {
    super.initState();
    isActive = false;
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        isActive = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(widget.title, style: fontRoboto(18.0, Colors.black)),
        ),
        Container(
          width: 200,
          height: 40,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(25),
          ),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 2000),
            curve: Curves.easeInOut,
            width: isActive ? widget.percent * 200 : 0,
            height: 40,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ],
    );
  }
}

class PopBtn extends StatelessWidget {
  final String name;
  PopBtn({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
            width: 150,
            height: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: nextBtnColor,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.25),
                    offset: Offset(0, 4))
              ],
            ),
            child: strokeText(name, white, 36)));
  }
}
