import 'package:flutter/material.dart';
import 'package:to_do_list/core/Forms/UpdataTaskForm.dart';

Future<void> showEditDialog({required BuildContext context, required String taskID}) {
  return showDialog(context: context, builder: (context) => Dialog(
    child: UpdateTaskForm(taskID: taskID),
  ));
}
