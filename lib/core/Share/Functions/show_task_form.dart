import 'package:flutter/material.dart';
import 'package:to_do_list/core/Forms/TaskForm.dart';
import 'package:to_do_list/core/style/ColorManager.dart';

Future<void> ShowTaskSheet(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: ColorManager.BrandPrimaryBackground,
    isDismissible: false,
    context: context,
    builder: (context) => 
          TaskForm()
      );
}
