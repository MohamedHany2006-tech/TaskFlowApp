import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_list/core/Utilis/unints.dart';
import 'package:to_do_list/core/style/AssetsManager.dart';
import 'package:to_do_list/core/style/ColorManager.dart';
import 'package:to_do_list/core/style/TextStyleManager.dart';

void showLoadingDialog({
  required BuildContext context,
  required String loadingMessage,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.NeutralBackground,
          borderRadius: .circular(Units.radius(context: context, value: 20)),
        ),
        padding: .all(10),
        margin: .symmetric(
          horizontal: Units.getHeight(context: context, value: 20),
        ),
        child: Column(
          mainAxisSize: .min,
          children: [
            Lottie.asset(
              AssetsManager.LoadIcon,
              width: Units.getWidth(context: context, value: 160),
              height: Units.getHeight(context: context, value: 160),
            ),
            Text(
              loadingMessage,
              style: TextStyleManager.textStyleNeutralPrimarySB16(context),
            ),
          ],
        ),
      ),
    ),
  );
}
