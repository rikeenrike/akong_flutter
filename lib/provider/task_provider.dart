import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task.dart';

class TaskNotifier extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String title, String description) {
    _tasks.add(Task(title: title, description: description));
    notifyListeners();
  }

  void toggleTaskDone(int index) {
    _tasks[index].done = !_tasks[index].done;
    notifyListeners();
  }

  void deleteTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks.removeAt(index);
      notifyListeners();
    } else {
      // Handle the case where the index is invalid
      print('Invalid index: $index');
    }
  }

  void deleteallTask() {
    _tasks.clear();
    notifyListeners();
  }
}

final taskProvider = ChangeNotifierProvider((ref) => TaskNotifier());