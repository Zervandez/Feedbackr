import 'package:edv_support/models/probleme.dart';
import 'package:edv_support/screens/danke.dart';
import 'package:edv_support/screens/message.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RatingScreen extends StatelessWidget {
  Problem p;
  RatingScreen({
    Key? key,
    required this.p,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Bitte geben Sie eine Bewertung ab"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: ratingList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) => Container(
                            width: MediaQuery.of(context).size.width / 11,
                            padding: const EdgeInsets.all(20),
                            child: ElevatedButton(
                              onPressed: () {
                                p.bewertung = ratingList[index] + 1;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const DankeScreen(),
                                    ));
                              },
                              child: Text(
                                (ratingList[index] + 1).toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 48,
                                  fontFamily: GoogleFonts.ptMono().fontFamily,
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
            ),
          ],
        ));
  }
}

List<int> ratingList = Iterable<int>.generate(10).toList();
