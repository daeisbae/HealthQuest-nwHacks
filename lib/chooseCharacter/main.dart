import 'package:flutter/material.dart';
import 'package:healthquest/chooseCharacter/traits.dart';
import 'package:healthquest/components.dart';
import 'package:healthquest/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({Key? key}) : super(key: key);

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
      child: const ChooseCharacterWindow(),
    );
  }
}

class ChooseCharacterWindow extends StatelessWidget {
  const ChooseCharacterWindow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        strokeText("Choose your character", Colors.black, 60),
        const ChooseCharacter(),
        NextBtn(name: "Next", nextPath: "/traits"),
      ],
    );
  }
}

class ChooseCharacter extends StatefulWidget {
  const ChooseCharacter({
    Key? key,
  }) : super(key: key);

  @override
  State<ChooseCharacter> createState() => _ChooseCharacterState();
}

class _ChooseCharacterState extends State<ChooseCharacter> {
  late int _selectedIndex;
  late int maxModels;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
    maxModels = 8;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        selectCharacterBtn(false),
        SizedBox(
          width: 400,
          child: Image.asset(
            "assets/models/model$_selectedIndex.gif",
            height: 400,
          ),
        ),
        selectCharacterBtn(true),
      ],
    );
  }

  Widget selectCharacterBtn(isRight) {
    return InkWell(
      onTap: (() {
        setState(() {
          isRight
              ? _selectedIndex = (_selectedIndex + 1) % maxModels
              : (_selectedIndex <= 0
                  ? _selectedIndex = maxModels - 1
                  : _selectedIndex -= 1);
          saveIndex();
        });
      }),
      child: Container(
        width: 110,
        alignment: Alignment.center,
        child: isRight
            ? Image.asset(
                "assets/images/rightBtn.png",
                width: 100,
              )
            : Image.asset(
                "assets/images/leftBtn.png",
                width: 100,
              ),
      ),
    );
  }

  void saveIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("characterIndex", _selectedIndex);
  }
}
