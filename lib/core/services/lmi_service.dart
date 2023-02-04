// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/services.dart';
import '../model/kosakata_model.dart';

class LmiService {
  //fetch content from json file 1000a
  Future<KosaKataModel> readWords1000a() async {
    final response =
        await rootBundle.loadString('assets/data/kosakata1000a.json');
    final data = await jsonDecode(response);

    print("berhasil fetch Words 1000a");
    print(data[2]);
    return KosaKataModel.fromJson(data[2]);
  }

  //fetch content from json file 1000b
  Future<KosaKataModel> readWords1000b() async {
    final response =
        await rootBundle.loadString('assets/data/kosakata1000b.json');
    final data = await jsonDecode(response);

    print("berhasil fetch Words 1000b");
    print(data[2]);
    return KosaKataModel.fromJson(data[2]);
  }

  //fetch content from json file 1000c
  Future<KosaKataModel> readWords1000c() async {
    final response =
        await rootBundle.loadString('assets/data/kosakata1000c.json');
    final data = await jsonDecode(response);

    print("berhasil fetch Words 1000c");
    print(data[2]);
    return KosaKataModel.fromJson(data[2]);
  }

  //fetch content from json file 1000d
  Future<KosaKataModel> readWords1000d() async {
    final response =
        await rootBundle.loadString('assets/data/kosakata1000d.json');
    final data = await jsonDecode(response);

    print("berhasil fetch Words 1000d");
    print(data[2]);
    return KosaKataModel.fromJson(data[2]);
  }

  //fetch content from json file 1000e
  Future<KosaKataModel> readWords1000e() async {
    final response =
        await rootBundle.loadString('assets/data/kosakata1000e.json');
    final data = await jsonDecode(response);

    print("berhasil fetch Words 1000e");
    print(data[2]);
    return KosaKataModel.fromJson(data[2]);
  }

  //fetch content from json file 1000f
  Future<KosaKataModel> readWords1000f() async {
    final response =
        await rootBundle.loadString('assets/data/kosakata1000f.json');
    final data = await jsonDecode(response);

    print("berhasil fetch Words 1000f");
    print(data[2]);
    return KosaKataModel.fromJson(data[2]);
  }

  //fetch content from json file 1000g
  Future<KosaKataModel> readWords1000g() async {
    final response =
        await rootBundle.loadString('assets/data/kosakata1000g.json');
    final data = await jsonDecode(response);

    print("berhasil fetch Words 1000g");
    print(data[2]);
    return KosaKataModel.fromJson(data[2]);
  }

  //fetch content from json file 7000
  Future<KosaKataModel> readWords7000() async {
    final response =
        await rootBundle.loadString('assets/data/kosakata7000.json');
    final data = await jsonDecode(response);

    print("berhasil fetch Words 7000");
    print(data[2]);
    return KosaKataModel.fromJson(data[2]);
  }
}
