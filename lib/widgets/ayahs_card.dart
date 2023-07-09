import 'package:first_app/screens/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:first_app/models/surah.dart';
import 'package:first_app/models/surah.dart';

class AyahsCard extends StatefulWidget {
  const AyahsCard({super.key, required this.quranModel});
  final QuranModel quranModel;

  @override
  State<AyahsCard> createState() => _AyahsCardState();
}

class _AyahsCardState extends State<AyahsCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => const HomeScrean()),
          );
        },
        child: Text("widget.quranModel.number"));
  }
}
