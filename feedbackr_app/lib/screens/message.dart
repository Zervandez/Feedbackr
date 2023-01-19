import 'package:edv_support/models/probleme.dart';
import 'package:edv_support/screens/danke.dart';
import 'package:edv_support/service/jira_connector.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  Problem p;
  MessageScreen({
    Key? key,
    required this.p,
  }) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Optionale Nachricht"),
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintStyle: TextStyle(fontSize: 17),
                  hintText: 'Ihre Name',
                  suffixIcon: Icon(Icons.person),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(20),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.tealAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextFormField(
                controller: messageController,
                maxLines: 5,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 8,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => sendToJiraConnector(
                    p, nameController.text, messageController.text, context),
                child: Text("Los legen!"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void sendToJiraConnector(Problem problem, String customerName, String message,
    BuildContext context) {
  problem.customerName = customerName;
  problem.message = message;
  //print(problem.toJson());

  sendMessage(problem.toJson());

  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DankeScreen(),
      ));
}
