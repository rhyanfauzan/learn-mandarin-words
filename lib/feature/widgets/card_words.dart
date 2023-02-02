// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../config/theme.dart';

class CardWords extends StatelessWidget {
  CardWords(
      {Key? key,
      this.nomor,
      this.pinyin,
      this.chinese = '',
      this.translate = ''})
      : super(key: key);
  String? nomor;
  String? pinyin;
  String? chinese;
  String? translate;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Stack(
        children: [
          nomor != null
              ? Positioned.fill(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          color: primary50Color,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              bottomRight: Radius.circular(20))),
                      child: Text(
                        nomor ?? '-',
                        style: blackTextStyle.copyWith(
                            fontSize: 20, fontWeight: medium, color: darkColor),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$chinese',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      blackTextStyle.copyWith(fontSize: 36, fontWeight: bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  pinyin ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: greyTextStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  '$translate',
                  overflow: TextOverflow.ellipsis,
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
