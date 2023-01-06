import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreen();
}

class _HelpScreen extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text("Yardım"),
      ),
      body: ListView.separated(
        itemCount: 6,
        separatorBuilder: (context, index) {
          return Divider(color: Colors.black.withOpacity(0.1), thickness: 1);
        },
        itemBuilder: ((context, index) {
          return ListTile(
            title: const Text("Lorem ipsum lorem?"),
            onTap: () {},
          );
        }),
      ),
    );
  }
}
