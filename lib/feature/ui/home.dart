// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mandarin_indo_app/core/model/kosakata_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List words = [];
  KosaKataModel kosaKataModel = KosaKataModel();

  //fetch content from json file
  Future<KosaKataModel> readWords() async {
    final response = await rootBundle.loadString('assets/data/words.json');
    final data = await jsonDecode(response);

    print("berhasil fetch Words");
    print(data[2]);
    setState(() {
      words = data;
      kosaKataModel = KosaKataModel.fromJson(data[2]);
      print(kosaKataModel.data?.length);
    });
    return KosaKataModel.fromJson(data[2]);
  }

  @override
  void initState() {
    print("init fetch");
    readWords();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("words: ${words.length}");
    print("kosakata : ${kosaKataModel.data?.length}");

    var data = kosaKataModel.data;

    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [Center(child: Text(data?[0].chinese ?? 'kosong'))],
        ));
  }
}
