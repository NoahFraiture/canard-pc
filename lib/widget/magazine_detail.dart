import 'dart:developer';

import 'package:flutter/material.dart';

import '../classes/magazine.dart';

class MagazineDetail extends StatefulWidget {
  final Magazine magazine;
  final VoidCallback onBack;

  const MagazineDetail({super.key, required this.magazine, required this.onBack});

  @override
  MagazineDetailState createState() => MagazineDetailState();
}

class MagazineDetailState extends State<MagazineDetail> {
  late Magazine magazine;

  @override
  void initState() {
    magazine = widget.magazine;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (v) => {log("1"), widget.onBack(), log("2")},
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: magazine.id,
              child: Image.asset(
                magazine.image,
                width: 300,
                height: 400, // Adjust height as needed
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Description',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  magazine.downloaded = !magazine.downloaded;
                });
                // Optional: Implement additional download or read logic
              },
              child: Text(magazine.downloaded ? 'Read' : 'Download'),
            ),
          ],
        ),
      ),
    );
  }
}
