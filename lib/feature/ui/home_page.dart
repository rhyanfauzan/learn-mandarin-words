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
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(
              height: 40,
            ),
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
              style: greyTextStyle.copyWith(fontSize: 18, fontWeight: regular),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomFilledButton(
              title: "A (1000)",
              bgColor: blue400Color,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WordsPage(
                    selectFetch: lmiService.readWords1000a(),
                    mypageword: 1,
                    title: "A (1000)",
                  );
                }));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomFilledButton(
              title: "B (1000)",
              bgColor: blue400Color,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WordsPage(
                    selectFetch: lmiService.readWords1000b(),
                    mypageword: 2,
                    title: "B (1000)",
                  );
                }));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomFilledButton(
              title: "C (1000)",
              bgColor: blue400Color,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WordsPage(
                    selectFetch: lmiService.readWords1000c(),
                    mypageword: 3,
                    title: "C (1000)",
                  );
                }));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomFilledButton(
              title: "D (1000)",
              bgColor: blue400Color,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WordsPage(
                    selectFetch: lmiService.readWords1000d(),
                    mypageword: 4,
                    title: "D (1000)",
                  );
                }));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomFilledButton(
              title: "E (1000)",
              bgColor: blue400Color,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WordsPage(
                    selectFetch: lmiService.readWords1000e(),
                    mypageword: 5,
                    title: "E (1000)",
                  );
                }));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomFilledButton(
              title: "F (1000)",
              bgColor: blue400Color,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WordsPage(
                    selectFetch: lmiService.readWords1000f(),
                    mypageword: 6,
                    title: "F (1000)",
                  );
                }));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomFilledButton(
              title: "G (1000)",
              bgColor: blue400Color,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WordsPage(
                    selectFetch: lmiService.readWords1000g(),
                    mypageword: 7,
                    title: "G (1000)",
                  );
                }));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomFilledButton(
              title: "7000 Kata",
              bgColor: blue400Color,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WordsPage(
                    selectFetch: lmiService.readWords7000(),
                    mypageword: 8,
                    title: "7000 Kata",
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WordsPage(
                        title: "A (1000)",
                        selectFetch: lmiService.readWords1000a(),
                        mypageword: 1,
                        indexWord: prefs.getInt('myindexword') ?? 0);
                  }));
                } else if (prefs.getInt('mypageword') == 2) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WordsPage(
                        title: "B (1000)",
                        selectFetch: lmiService.readWords1000b(),
                        mypageword: 2,
                        indexWord: prefs.getInt('myindexword') ?? 0);
                  }));
                } else if (prefs.getInt('mypageword') == 3) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WordsPage(
                        title: "C (1000)",
                        selectFetch: lmiService.readWords1000c(),
                        mypageword: 3,
                        indexWord: prefs.getInt('myindexword') ?? 0);
                  }));
                } else if (prefs.getInt('mypageword') == 4) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WordsPage(
                        title: "D (1000)",
                        selectFetch: lmiService.readWords1000d(),
                        mypageword: 4,
                        indexWord: prefs.getInt('myindexword') ?? 0);
                  }));
                } else if (prefs.getInt('mypageword') == 5) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WordsPage(
                        title: "E (1000)",
                        selectFetch: lmiService.readWords1000e(),
                        mypageword: 5,
                        indexWord: prefs.getInt('myindexword') ?? 0);
                  }));
                } else if (prefs.getInt('mypageword') == 6) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WordsPage(
                        title: "F (1000)",
                        selectFetch: lmiService.readWords1000f(),
                        mypageword: 6,
                        indexWord: prefs.getInt('myindexword') ?? 0);
                  }));
                } else if (prefs.getInt('mypageword') == 7) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WordsPage(
                        title: "G (1000)",
                        selectFetch: lmiService.readWords1000g(),
                        mypageword: 7,
                        indexWord: prefs.getInt('myindexword') ?? 0);
                  }));
                } else if (prefs.getInt('mypageword') == 8) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WordsPage(
                        title: "7000 Kata",
                        selectFetch: lmiService.readWords7000(),
                        mypageword: 8,
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
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
