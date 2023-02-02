// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:mandarin_indo_app/config/app_asset.dart';
import 'package:mandarin_indo_app/config/theme.dart';
import 'package:mandarin_indo_app/feature/widgets/buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/model/kosakata_model.dart';
import '../../core/services/lmi_service.dart';
import 'word_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var prefs;
  int? mypageword;
  int? myindexword;
  LmiService lmiService = LmiService();
  late Future<KosaKataModel> selectFetch;

  initprefs() async {
    // Obtain shared preferences.
    prefs = await SharedPreferences.getInstance();

    setState(() {
      // Try reading data from the 'mypageword & myindexword' key. If it doesn't exist, returns null.
      mypageword = prefs.getInt('mypageword');
      myindexword = prefs.getInt('myindexword');
      print('mypageword $mypageword');
      print('myindexword $myindexword');
    });
  }

  @override
  void initState() {
    initprefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mWidth = MediaQuery.of(context).size.width - 0.2;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppAsset.ilChinese,
                width: mWidth,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Hello, \nWelcome Back!',
                style: blackTextStyle.copyWith(
                    fontSize: 24, fontWeight: bold, color: darkColor),
              ),
              Text(
                'What do you want to learn today?',
                style:
                    greyTextStyle.copyWith(fontSize: 18, fontWeight: regular),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomFilledButton(
                title: "5000 Kata",
                bgColor: blue400Color,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WordsPage(
                      selectFetch: lmiService.readWords5000(),
                      mypageword: 1,
                    );
                  }));
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFilledButton(
                title: "2000 Kata",
                bgColor: blue400Color,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WordsPage(
                      selectFetch: lmiService.readWords2000(),
                      mypageword: 2,
                    );
                  }));
                },
              ),
              const SizedBox(
                height: 40,
              ),
              CustomFilledButton(
                title: "Continue Learn",
                bgColor: greenColor,
                onPressed: () {
                  if (prefs.getInt('mypageword') == 1) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return WordsPage(
                          selectFetch: lmiService.readWords5000(),
                          mypageword: 1,
                          indexWord: prefs.getInt('myindexword') ?? 0);
                    }));
                  } else if (prefs.getInt('mypageword') == 2) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return WordsPage(
                          selectFetch: lmiService.readWords2000(),
                          mypageword: 2,
                          indexWord: prefs.getInt('myindexword') ?? 0);
                    }));
                  } else {
                    var snackBar = SnackBar(
                      backgroundColor: darkGreyColor,
                      content: Text(
                        "Anda belum menyimpan history belajar",
                        style: whiteTextStyle,
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
