// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, must_be_immutable, no_logic_in_create_state, unused_local_variable, use_build_context_synchronously

import 'dart:math';

import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:mandarin_indo_app/core/model/kosakata_model.dart';
import 'package:mandarin_indo_app/core/services/lmi_service.dart';
import 'package:mandarin_indo_app/feature/widgets/card_words.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/app_asset.dart';
import '../../config/theme.dart';

class WordsPage extends StatefulWidget {
  WordsPage(
      {super.key,
      this.indexWord = 0,
      required this.selectFetch,
      required this.mypageword});
  int indexWord;
  int mypageword;
  Future<KosaKataModel> selectFetch;

  @override
  State<WordsPage> createState() =>
      _WordsPageState(indexWord, selectFetch, mypageword);
}

class _WordsPageState extends State<WordsPage> {
  _WordsPageState(this.indexWord, this.selectFetch, this.mypageword);

  KosaKataModel kosaKataModel = KosaKataModel();
  late Future<KosaKataModel> futureWords;
  Future<KosaKataModel> selectFetch;
  LmiService lmiService = LmiService();
  int mypageword;
  bool autoPlay = true;
  bool randomPlay = false;
  int playDelay = 7000;
  int indexWord;
  var random = Random();
  int indexColor = 0;
  Color bgWord = primaryColor;
  final List<Color> bgWords = [
    purpleColor,
    primaryColor,
    primary50Color,
    creamColor,
    pinkColor,
    orangeColor,
    yellowColor,
    greenColor,
  ];

  final List<String> autoplayitems = [
    '(off)',
    '2 detik',
    '4 detik',
    '6 detik',
    '8 detik',
  ];
  String? selectedValue;
  var prefs;

  @override
  void initState() {
    print("init fetch");
    futureWords = selectFetch;
    initprefs();
    super.initState();
  }

  initprefs() async {
    // Obtain shared preferences.
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    var mHeight = MediaQuery.of(context).size.height / 1.7;

    return Scaffold(
        body: FutureBuilder<KosaKataModel>(
            future: futureWords,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data?.data;

                print("words: ${data?.length}");
                print("words 1: ${data?[0].chinese}");
                return ListView(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 130,
                          decoration: BoxDecoration(
                              color: bgWord,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (indexColor == bgWords.length - 1) {
                                      indexColor = 0;
                                      setState(() {
                                        bgWord = bgWords[indexColor];
                                      });
                                    } else {
                                      indexColor++;
                                      setState(() {
                                        bgWord = bgWords[indexColor];
                                      });
                                    }
                                  });
                                  print(bgWord);
                                },
                                child: const Icon(
                                  Icons.color_lens_outlined,
                                  size: 24,
                                  color: whiteColor,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        ),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 40,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(250),
                                child: Image.asset(
                                  AppAsset.avatar,
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                        height: mHeight,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Swiper(
                          index: indexWord,
                          autoplay: autoPlay,
                          autoplayDelay: playDelay,
                          pagination: SwiperCustomPagination(builder:
                              (BuildContext context,
                                  SwiperPluginConfig config) {
                            int activeIndex = indexWord;
                            int itemCount = config.itemCount + 1;
                            return Padding(
                              padding: const EdgeInsets.all(16),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        "${indexWord + 1} / $itemCount",
                                        style: blackTextStyle.copyWith(
                                            fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                          control: const SwiperControl(
                              color: darkColor,
                              padding: EdgeInsets.symmetric(horizontal: 20)),
                          itemCount: data?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            if (randomPlay == true) {
                              indexWord = random.nextInt(data!.length);
                              return CardWords(
                                chinese: data[indexWord].chinese,
                                pinyin: data[indexWord].pinying,
                                translate: data[indexWord].translate,
                              );
                            } else {
                              indexWord = index;
                              return CardWords(
                                chinese: data?[indexWord].chinese,
                                pinyin: data?[indexWord].pinying,
                                translate: data?[indexWord].translate,
                              );
                            }
                          },
                        )),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomDropdownButton2(
                            hint: 'Auto Play',
                            dropdownItems: autoplayitems,
                            value: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value;
                                if (selectedValue == '2 detik') {
                                  autoPlay = true;
                                  playDelay = 2000;
                                } else if (selectedValue == '4 detik') {
                                  autoPlay = true;
                                  playDelay = 4000;
                                } else if (selectedValue == '6 detik') {
                                  autoPlay = true;
                                  playDelay = 6000;
                                } else if (selectedValue == '8 detik') {
                                  autoPlay = true;
                                  playDelay = 8000;
                                } else if (selectedValue == '(off)') {
                                  autoPlay = false;
                                }
                              });
                              print("autoPlay ");
                              print("randomPlay ");
                              print("playDelay ");
                            },
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (randomPlay == false) {
                                  randomPlay = true;
                                } else {
                                  randomPlay = false;
                                }
                              });
                            },
                            child: Icon(randomPlay
                                ? Icons.shuffle_on_outlined
                                : Icons.shuffle_outlined),
                          ),
                          InkWell(
                            onTap: () async {
                              // Save an integer value to 'mypageword' key.
                              await prefs.setInt('mypageword', mypageword);
                              await prefs.setInt('myindexword', indexWord);
                              var snackBar = SnackBar(
                                backgroundColor: greenColor,
                                content: Text(
                                  "Berhasil menyimpan history belajar",
                                  style: whiteTextStyle,
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            child: Material(
                              color: blue400Color,
                              borderRadius: BorderRadius.circular(6),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Text(
                                  'Save',
                                  style: whiteTextStyle,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
