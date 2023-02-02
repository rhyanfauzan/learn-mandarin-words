// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/services.dart';
import '../model/kosakata_model.dart';

class LmiService {
  //fetch content from json file
  Future<KosaKataModel> readWords5000() async {
    final response =
        await rootBundle.loadString('assets/data/kosakata5000.json');
    final data = await jsonDecode(response);

    print("berhasil fetch Words 5000");
    print(data[2]);
    return KosaKataModel.fromJson(data[2]);
  }

  //fetch content from json file
  Future<KosaKataModel> readWords2000() async {
    final response =
        await rootBundle.loadString('assets/data/kosakata2000.json');
    final data = await jsonDecode(response);

    print("berhasil fetch Words 2000");
    print(data[2]);
    return KosaKataModel.fromJson(data[2]);
  }
}
