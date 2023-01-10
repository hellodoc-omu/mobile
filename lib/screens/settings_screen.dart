import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreen();
}

class _SettingsScreen extends State<SettingsScreen> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text("Ayarlar"),
      ),
      body: Column(
        children: [
          SizedBox(height: 25,),
        Row(
          children: [
            SizedBox(width: 20),
            Switch(
            value: switchValue,
            materialTapTargetSize: MaterialTapTargetSize.values[1],
            onChanged: (value) {
              setState(() {
                switchValue = value;
                print(switchValue);
              });
            },
            activeTrackColor: Colors.blue,
            activeColor: Colors.blueAccent,
      ),
            SizedBox(width: 20,),
            Text(
                "Bildirim",
                textAlign: TextAlign.right,
                style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 25),
            ),
          ],
        ),
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 20),
              Switch(
                value: switchValue,
                materialTapTargetSize: MaterialTapTargetSize.values[1],
                onChanged: (value) {
                  setState(() {
                    switchValue = value;
                    print(switchValue);
                  });
                },
                activeTrackColor: Colors.blue,
                activeColor: Colors.blueAccent,
              ),
              SizedBox(width: 20,),
              Text(
                "Bildirim",
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 25),
              ),
            ],

          ),
        ],
      ),
    );
  }
}
