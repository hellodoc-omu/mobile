import 'package:flutter/material.dart';

class HelpDetailsScreen extends StatelessWidget {
  const HelpDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text("Lorem ipsum lorem?"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.topLeft,
          child: const Text(
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Cum tempore, inventore error itaque quibusdam dolorem eveniet, in deleniti vitae ducimus qui optio? Ex eos aliquam culpa temporibus mollitia cumque enim nulla recusandae adipisci saepe, dignissimos distinctio, quia quod facere, non inventore ut corrupti. Consequuntur perspiciatis neque eaque illum iusto fugiat?",
            softWrap: true,
          ),
        ),
      ),
    );
  }
}
