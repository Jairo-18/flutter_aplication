import 'package:flutter_riverpod/flutter_riverpod.dart';

class Task {
  final String title;
  bool isCompleted;

  Task({required this.title, this.isCompleted = false});
}

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier() : super([]);

  void addTask(String title) {
    state = [...state, Task(title: title)];
  }

  void toggleTask(int index) {
    final updatedTask = state[index];
    updatedTask.isCompleted = !updatedTask.isCompleted;
    state = [...state]..[index] = updatedTask;
  }

  void removeCompletedTasks() {
    state = state.where((task) => !task.isCompleted).toList();
  }
}

final taskListProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  return TaskNotifier();
});
