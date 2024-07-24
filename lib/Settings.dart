import 'package:flutter/material.dart';
import 'package:google_keep_notes/colors.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        iconTheme: IconThemeData(color: white),
        elevation: 0.0,
        title: Text(
          "Settings",
          style: TextStyle(color: white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Sync",
                  style: TextStyle(color: white, fontSize: 20),
                ),
                Spacer(),
                Transform.scale(
                  scale: 1.1,
                  child: Switch.adaptive(
                      value: value,
                      onChanged: (SwitchValue) {
                        setState(() {
                          this.value = SwitchValue;
                        });
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
