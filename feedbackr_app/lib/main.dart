import 'dart:convert';
import 'dart:math';

import 'package:edv_support/models/probleme.dart';
import 'package:edv_support/screens/danke.dart';
import 'package:edv_support/screens/rating.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const HomeScreen(),
        '/danke': (context) => const DankeScreen(),
      },
      title: 'Feedbackr',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        secondaryHeaderColor: Colors.blueAccent,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange,
          elevation: 3,
          toolbarHeight: 100,
          titleTextStyle: GoogleFonts.ptSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 48,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Was denkst du?",
          ),
        ),
        body: SelectionGrid(
          problemType: problemsList,
        ),
      ),
    );
  }
}

class SelectionGrid extends StatelessWidget {
  List problemType;
  SelectionGrid({
    Key? key,
    required this.problemType,
  }) : super(key: key);

  Problem p = Problem(id: getRandomString(6));

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(32),
      physics: ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.5,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
      ),
      children: [
        ...problemType.map(
          (e) => ElevatedButton(
            onPressed: () {
              p.thema = e.name;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RatingScreen(
                      p: p,
                    ),
                  ));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  e.name,
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: GoogleFonts.ptMono().fontFamily,
                  ),
                ),
                //Image.asset('sdncsj'),

                Icon(
                  e.icon,
                  size: 64,
                ),
                Text("Drücken Sie hier für Feedback.")
              ],
            ),
          ),
        ),
      ],
    );
  }
}

String getRandomString(int len) {
  var random = Random.secure();
  var values = List<int>.generate(len, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

class ProblemType {
  String name;
  IconData icon;
  ProblemType({
    Key? key,
    required this.name,
    required this.icon,
  });
}

List<ProblemType> problemsList = [
  ProblemType(name: "Toiletten Sauberkeit", icon: Icons.clean_hands_rounded),
  ProblemType(name: "Feedbackr", icon: Icons.star),
  ProblemType(name: "Internet/ Wi-Fi", icon: Icons.wifi_find_rounded),
  ProblemType(name: "Mensa Essen", icon: Icons.fastfood_outlined),
  ProblemType(name: "Party Möglichkeiten", icon: Icons.celebration_outlined),
  ProblemType(name: "Freizeit Aktivitäten", icon: Icons.nordic_walking),
  ProblemType(
      name: "Neue Uni-Logo Abstimmung", icon: Icons.lightbulb_outline_rounded),
  ProblemType(name: "Bibliothek Qualität", icon: Icons.device_hub),
  ProblemType(
      name: "Neuste Kunstwerk an der Uni bewerten",
      icon: Icons.stacked_bar_chart_rounded),
];
