// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../config/app_asset.dart';
import '../../config/theme.dart';

class CardRepositories extends StatelessWidget {
  CardRepositories(
      {Key? key, this.nomor, this.pinyin, this.chinese, this.translate})
      : super(key: key);
  String? nomor;
  String? pinyin;
  String? chinese;
  String? translate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              AppAsset.avatar,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$nomor $chinese',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: blackTextStyle.copyWith(fontSize: 16),
                ),
                Text(
                  '$pinyin $translate',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: greyTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
