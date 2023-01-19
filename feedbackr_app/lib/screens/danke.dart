import 'dart:async';

import 'package:edv_support/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DankeScreen extends StatefulWidget {
  const DankeScreen({super.key});

  @override
  State<DankeScreen> createState() => _DankeScreenState();
}

class _DankeScreenState extends State<DankeScreen> {
  int seconds = 45;
  late Timer _timer;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (seconds == 0) {
          setState(() {
            timer.cancel();
          });
          restartApp(context);
        } else {
          setState(() {
            seconds--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Bitte lassen Sie jemanden anderes dran! ;)"),
      ),
      body: Container(
        child: Center(
          child: Text("00:$seconds",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 72,
                fontFamily: GoogleFonts.ptMono().fontFamily,
              )),
        ),
      ),
    );
  }
}

void restartApp(BuildContext context) {
  Navigator.popUntil(context, ModalRoute.withName('/home'));
  Navigator.pushNamed(context, '/home');
}
