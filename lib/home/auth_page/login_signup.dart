import 'package:flutter/material.dart';
import 'package:kajian_sunnah/home/auth_page/login.dart';
import 'package:kajian_sunnah/home/auth_page/register.dart';
import 'package:kajian_sunnah/widget/E_button.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: 414,
          height: 896,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.centerLeft,
              radius: 1.5,
              focalRadius: 0.8,
              colors: [
                Colors.blueAccent,
                Colors.white,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 95),
                  Container(
                    width: 370,
                    height: 237,
                    child: Image.asset(
                      "assets/images/Group.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Kajian Sunnah Kini Mudah',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ProzaLibre-Bold',
                      wordSpacing: 5,
                      height: 1.0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Aplikasi ini hadir untuk mendukung aktifitas kaum muslimin mendapatkan agenda, artikel dan pengumuman seputar kajian sunnah',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  Ebutton(
                    btncolor: Colors.white,
                    text: ('Create an Account'),
                    onpress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Register();
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 15),
                  Ebutton(
                    btncolor: Colors.blue,
                    text: ('Login'),
                    txtcolor: Colors.white,
                    onpress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Login();
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: 215,
                    height: 2,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Continue without sign in',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
