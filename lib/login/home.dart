import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:healthquest/style.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover)),
      child: LoginBtn(),
    );
  }
}

class LoginBtn extends StatefulWidget {
  const LoginBtn({Key? key}) : super(key: key);

  @override
  State<LoginBtn> createState() => _LoginBtnState();
}

class _LoginBtnState extends State<LoginBtn> {
  late GoogleSignIn _googleSignIn;
  @override
  void initState() {
    super.initState();
    _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      alignment: Alignment.center,
      child: ElevatedButton(
          onPressed: () {
            _googleSignIn.signIn().then((value) {
              value?.authentication.then((googleKey) {
                Navigator.pushReplacementNamed(context, '/character');
              });
            });
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Image.asset(
              "assets/images/google.png",
              width: 50,
            ),
            Text(
              "Sign In With Google",
              style: fontRoboto(14, Colors.grey),
            )
          ])),
    );
  }
}
