// ignore_for_file: must_be_immutable, avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/theme.dart';

class CardWords extends StatefulWidget {
  CardWords({
    Key? key,
    this.nomor,
    this.pinyin,
    this.chinese = '',
    this.translate = '',
  }) : super(key: key);
  String? nomor;
  String? pinyin;
  String? chinese;
  String? translate;

  @override
  State<CardWords> createState() => _CardWordsState();
}

class _CardWordsState extends State<CardWords> {
  int indexColor = 0;
  Color bgWord = whiteColor;
  var prefs;
  final List<Color> bgWords = [
    whiteColor,
    primaryColor,
    primary50Color,
    creamColor,
    pinkColor,
    orangeColor,
    yellowColor,
    greenColor,
    purpleColor,
  ];

  initprefs() async {
    // Obtain shared preferences.
    prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('indexColor') != null) {
      indexColor = prefs.getInt('indexColor');
      bgWord = bgWords[indexColor];
    }
  }

  @override
  void initState() {
    initprefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: bgWord,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () async {
                  if (indexColor == bgWords.length - 1) {
                    indexColor = 0;
                    await prefs.setInt('indexColor', indexColor);
                    setState(() {
                      bgWord = bgWords[indexColor];
                    });
                  } else {
                    indexColor++;
                    await prefs.setInt('indexColor', indexColor);
                    setState(() {
                      bgWord = bgWords[indexColor];
                    });
                  }
                  print("bgWord $bgWord");
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Icon(
                    Icons.format_color_fill_rounded,
                    size: 24,
                    color: darkColor,
                  ),
                ),
              ),
              // Container(
              //   padding: const EdgeInsets.symmetric(
              //       horizontal: 20, vertical: 10),
              //   decoration: const BoxDecoration(
              //       color: primary50Color,
              //       borderRadius: BorderRadius.only(
              //           topLeft: Radius.circular(6),
              //           bottomRight: Radius.circular(20))),
              //   child: Text(
              //     nomor ?? '-',
              //     style: blackTextStyle.copyWith(
              //         fontSize: 20, fontWeight: medium, color: darkColor),
              //   ),
              // ),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${widget.chinese}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      blackTextStyle.copyWith(fontSize: 36, fontWeight: bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.pinyin ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: blackTextStyle.copyWith(fontSize: 22),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  widget.translate ?? '',
                  textAlign: TextAlign.center,
                  style: blackTextStyle.copyWith(fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
