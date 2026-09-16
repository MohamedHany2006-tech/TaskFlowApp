import 'package:flutter/material.dart';
import 'package:to_do_list/core/Utilis/unints.dart';
import 'package:to_do_list/core/style/AssetsManager.dart';
import 'package:to_do_list/core/style/TextStyleManager.dart';

class CustomeAppBar extends StatefulWidget {
  const CustomeAppBar({super.key});

  @override
  State<CustomeAppBar> createState() => _CustomeAppBarState();
}

class _CustomeAppBarState extends State<CustomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(
        horizontal: Units.getHeight(context: context, value: 24),
        vertical: Units.getWidth(context: context, value: 24)
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Text('TaskFlow', style: TextStyleManager.textStyleNeutralPrimarySB24(context)),
              Text('Best platform for creating to-do lists', style: TextStyleManager.textStyleNeutralSecondaryR14(context),)
            ],
          ),
          Image.asset(AssetsManager.Setting),
        ],
      ),
    );
  }
}