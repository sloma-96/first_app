import 'dart:collection';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:first_app/models/ayah.dart';
import 'package:first_app/models/surah.dart';
import 'package:first_app/provider/surahs_provider.dart';
import 'package:first_app/widgets/ayahs_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SurahsScreen extends StatefulWidget {
  const SurahsScreen({super.key, required this.number});
  final String number;
  // final QuranModel quranModel;

  @override
  State<SurahsScreen> createState() => _SurahsScreenState();
}

class _SurahsScreenState extends State<SurahsScreen> {
  @override
  void initState() {
    Provider.of<SurahProvider>(context, listen: false).fetchAyah();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SurahProvider>(builder: (context, surProvider, child) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              AppLocalizations.of(context)!.quranapp,
              style: const TextStyle(color: Color.fromARGB(255, 3, 128, 44)),
            ),
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black38),
          ),
          body: Card(
            child: SizedBox(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return AyahsCard(
                    quranModel: surProvider.quran[index],
                  );
                },
                itemCount: surProvider.quran.length,
              ),
            ),
          ));
    });
  }
}
