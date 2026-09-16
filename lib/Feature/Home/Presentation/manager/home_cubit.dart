import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/Feature/Home/Presentation/manager/home_state.dart';
import 'package:to_do_list/core/Utilis/Firebase/Firebase_Services.dart';
import 'package:to_do_list/core/data/model/Task_data_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  final FirebaseServices firebaseServices = FirebaseServices();

  StreamSubscription<List<TaskDataModel>>? taskSubscription;

  Future<void> createTask({
    required TaskDataModel tasks,
  }) async {
    emit(InitialTaskCreationState());

    try {
      emit(LoadingTaskCreationState());

      await firebaseServices.createTask(tasks);

      emit(SuccessTaskCreationState());
    } catch (e) {
      emit(
        FailureTaskCreationState(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void getTask() {
    emit(InitialTaskGettingState());

    taskSubscription?.cancel();

    emit(LoadingTaskGettingState());

    taskSubscription = firebaseServices.getTask().listen(
      (tasks) {
        emit(
          SuccessTaskGettingState(
            tasks: tasks,
          ),
        );
      },
      onError: (error) {
        emit(
          FailureTaskGettingState(
            errorMessage: error.toString(),
          ),
        );
      },
    );
  }

  Future<void> getTaskID({
    required String Id,
  }) async {
    emit(InitialTaskGettingIDState());

    try {
      emit(LoadingTaskGettingIDState());

      final task = await firebaseServices.getTaskByID(
        taskID: Id,
      );

      emit(
        SuccessTaskGettingIDState(
          task: task,
        ),
      );
    } catch (e) {
      emit(
        FailureTaskGettingIDState(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> updateTaskStatus({
    required String taskID,
    required bool isDone,
  }) async {
    emit(InitialTaskUpdateStatusState());

    try {
      emit(LoadingTaskUpdateStatusState());

      await firebaseServices.updateTaskStatus(
        isDone: isDone,
        taskID: taskID,
      );

      emit(SuccessTaskUpdateStatusState());
    } catch (e) {
      emit(
        FailureTaskUpdateStatusState(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> updateTask({
    required String taskID,
    required TaskDataModel newTask,
  }) async {
    emit(InitialTaskUpdateState());

    try {
      emit(LoadingTaskUpdateState());

      await firebaseServices.updateTask(
        newTask: newTask,
        taskID: taskID,
      );

      emit(SuccessTaskUpdateState());
    } catch (e) {
      emit(
        FailureTaskUpdateState(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> deleteTask({
    required String taskID,
  }) async {
    emit(InitialTaskDeleteState());

    try {
      emit(LoadingTaskDeleteState());

      await firebaseServices.deleteTask(
        taskID: taskID,
      );

      emit(SuccessTaskDeleteState());
    } catch (e) {
      emit(
        FailureTaskDeleteState(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    taskSubscription?.cancel();
    return super.close();
  }
}