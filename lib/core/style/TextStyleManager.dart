import 'package:flutter/material.dart';
import 'package:to_do_list/core/Utilis/unints.dart';
import 'package:to_do_list/core/style/ColorManager.dart';
import 'package:to_do_list/core/style/Custome_font_Weight.dart';

class TextStyleManager {
  static TextStyle textStylePrimaryBrandLight18(BuildContext context) => TextStyle(
    color: ColorManager.BrandPrimaryDefault,
    fontSize: Units.fontSize(context: context, value: 18),
    fontWeight: CustomeFontWeight.regular,
  );
  static TextStyle textStyleNeutralPrimarySB26 (BuildContext context)=> TextStyle(
    color: ColorManager.NeutralPrimary,
    fontSize: Units.fontSize(context: context, value: 26),
    fontWeight: CustomeFontWeight.semiBold,
  );
  static TextStyle textStyleNeutralSecondaryR14(BuildContext context) => TextStyle(
    color: ColorManager.NeutralSecondary,
    fontSize: Units.fontSize(context: context, value: 14),
    fontWeight: CustomeFontWeight.regular,
  );
  static TextStyle textStyleNeutralPrimaryB24(BuildContext context) => TextStyle(
    color: ColorManager.NeutralPrimary,
    fontSize: Units.fontSize(context: context, value: 24),
    fontWeight: CustomeFontWeight.Bold,
  );
  static TextStyle textStyleNeutralPrimarySB24(BuildContext context) => TextStyle(
    color: ColorManager.NeutralPrimary,
    fontSize: Units.fontSize(context: context, value: 24),
    fontWeight: CustomeFontWeight.semiBold,
  );
  static TextStyle textStyleBrandPrimaryDefaultB24(BuildContext context) => TextStyle(
    color: ColorManager.BrandPrimaryDefault,
    fontSize: Units.fontSize(context: context, value: 24),
    fontWeight: CustomeFontWeight.Bold,
  );
  static TextStyle textStyleBrandPrimaryDefaultB14(BuildContext context) => TextStyle(
    color: ColorManager.BrandPrimaryDefault,
    fontSize: Units.fontSize(context: context, value: 14),
    fontWeight: CustomeFontWeight.Bold,
  );
  static TextStyle textStyleNeutralWhiteM18(BuildContext context) => TextStyle(
    color: ColorManager.NeutralWhite,
    fontSize: Units.fontSize(context: context, value: 18),
    fontWeight: CustomeFontWeight.medium,
  );
  static TextStyle textStyleNeutralPrimaryM16(BuildContext context) => TextStyle(
    color: ColorManager.NeutralPrimary,
    fontSize: Units.fontSize(context: context, value: 16),
    fontWeight: CustomeFontWeight.medium,
  );
  static TextStyle textStyleNeutralPrimaryM12(BuildContext context) => TextStyle(
    color: ColorManager.NeutralPrimary,
    fontSize: Units.fontSize(context: context, value: 12),
    fontWeight: CustomeFontWeight.medium,
  );
  static TextStyle textStyleNeutralPrimarySB16(BuildContext context) => TextStyle(
    color: ColorManager.NeutralPrimary,
    fontSize: Units.fontSize(context: context, value: 16),
    fontWeight: CustomeFontWeight.semiBold,
  );
  static TextStyle textStyleNeutralGhostR16(BuildContext context) => TextStyle(
    color: ColorManager.NeutralGhost,
    fontSize: Units.fontSize(context: context, value: 16),
    fontWeight: CustomeFontWeight.regular,
  );
  static TextStyle textStyleNeutralSecondaryR16(BuildContext context) => TextStyle(
    color: ColorManager.NeutralSecondary,
    fontSize: Units.fontSize(context: context, value: 16),
    fontWeight: CustomeFontWeight.regular,
  );
  static TextStyle textStyleNeutralSecondaryR12(BuildContext context) => TextStyle(
    color: ColorManager.NeutralSecondary,
    fontSize: Units.fontSize(context: context, value: 12),
    fontWeight: CustomeFontWeight.regular,
  );
  static TextStyle textStyleNeutralWhiteB26(BuildContext context) => TextStyle(
    color: ColorManager.NeutralWhite,
    fontSize: Units.fontSize(context: context, value: 26),
    fontWeight: CustomeFontWeight.Bold,
  );
}
