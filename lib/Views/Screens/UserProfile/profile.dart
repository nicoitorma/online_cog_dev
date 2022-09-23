import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Row(
            children: [
              const Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  child: Icon(Icons.person),
                  radius: 10.0,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                color: Colors.lightBlueAccent,
                child: Row(
                  children: const [
                    Icon(Icons.person_outline),
                    Text("U S E R N A M E")
                  ],
                ),
              ),
            ],
          )
        ]),
      ),
    ));
  }
}
