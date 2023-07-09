import 'package:first_app/screens/surahs_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_app/models/surah.dart';
import 'package:flutter/cupertino.dart';

class CardItem extends StatefulWidget {
  const CardItem({super.key, required this.quranModel});
  final QuranModel quranModel;
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SurahsScreen(
                    number: widget.quranModel.number.toString(),
                  )),
        );
      },
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Card(
            child: ListTile(
              title: Text(widget.quranModel.name),
              subtitle: Text(widget.quranModel.revelationType == "Meccan"
                  ? "مكية"
                  : "مدنية"),
              leading: Text(widget.quranModel.number.toString()),
              trailing: Text(widget.quranModel.ayahs.length.toString()),
              //  isThreeLine: Text(widget.quranModel),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
