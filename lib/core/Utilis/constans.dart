import 'package:flutter/material.dart';
import 'package:to_do_list/core/Utilis/unints.dart';

class Constans {
  static Size getAppBarSize(BuildContext context) {
    return Size(.infinity, Units.getHeight(context: context, value: 130));
  }
  static const FirebaseTaskCollection = 'Tasks';
  static const kUserToken = 'kUserToken';
}
