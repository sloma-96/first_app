import 'package:first_app/provider/surahs_provider.dart';
import 'package:first_app/widgets/card_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScrean extends StatefulWidget {
  const HomeScrean({super.key});

  @override
  State<HomeScrean> createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {
  @override
  void initState() {
    Provider.of<SurahProvider>(context, listen: false).fetchSurah();
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
          drawer: SafeArea(
            child: Drawer(
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  ListTile(
                    leading: const Icon(Icons.save),
                    title: const Text(' Save '),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.translate),
                    title: const Text('EN'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.translate),
                    title: const Text('AR'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Setting'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('LogOut'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  // Column(
                  //   children: [
                  //     FloatingActionButton(
                  //       onPressed: () {},
                  //       backgroundColor: Colors.lightGreen[400],
                  //       // child: Icon(Icons.add),
                  //       child: const Text("AR"),
                  //     ),
                  //     SizedBox(
                  //       height: 25,
                  //     ),
                  //     FloatingActionButton(
                  //       onPressed: () {},
                  //       backgroundColor: Colors.lightGreen[400],
                  //       // child: Icon(Icons.add),
                  //       child: const Text("AR"),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
          // body: CardItem(),
          body: Card(
            child: SizedBox(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return CardItem(
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
