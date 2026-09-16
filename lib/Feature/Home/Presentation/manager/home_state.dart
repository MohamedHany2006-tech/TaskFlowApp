import 'package:to_do_list/core/data/model/Task_data_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

// Creating task

class InitialTaskCreationState extends HomeState {}

class LoadingTaskCreationState extends HomeState {}

class SuccessTaskCreationState extends HomeState {}

class FailureTaskCreationState extends HomeState {
  final String errorMessage;

  FailureTaskCreationState({
    required this.errorMessage,
  });
}

// Getting task ID

class InitialTaskGettingIDState extends HomeState {}

class LoadingTaskGettingIDState extends HomeState {}

class SuccessTaskGettingIDState extends HomeState {
  final TaskDataModel task;

  SuccessTaskGettingIDState({
    required this.task,
  });
}

class FailureTaskGettingIDState extends HomeState {
  final String errorMessage;

  FailureTaskGettingIDState({
    required this.errorMessage,
  });
}

// Getting tasks

class InitialTaskGettingState extends HomeState {}

class LoadingTaskGettingState extends HomeState {}

class SuccessTaskGettingState extends HomeState {
  final List<TaskDataModel> tasks;

  SuccessTaskGettingState({
    required this.tasks,
  });
}

class FailureTaskGettingState extends HomeState {
  final String errorMessage;

  FailureTaskGettingState({
    required this.errorMessage,
  });
}

// Updating task status

class InitialTaskUpdateStatusState extends HomeState {}

class LoadingTaskUpdateStatusState extends HomeState {}

class SuccessTaskUpdateStatusState extends HomeState {}

class FailureTaskUpdateStatusState extends HomeState {
  final String errorMessage;

  FailureTaskUpdateStatusState({
    required this.errorMessage,
  });
}

// Updating task

class InitialTaskUpdateState extends HomeState {}

class LoadingTaskUpdateState extends HomeState {}

class SuccessTaskUpdateState extends HomeState {}

class FailureTaskUpdateState extends HomeState {
  final String errorMessage;

  FailureTaskUpdateState({
    required this.errorMessage,
  });
}

// Delete task

class InitialTaskDeleteState extends HomeState {}

class LoadingTaskDeleteState extends HomeState {}

class SuccessTaskDeleteState extends HomeState {}

class FailureTaskDeleteState extends HomeState {
  final String errorMessage;

  FailureTaskDeleteState({
    required this.errorMessage,
  });
}