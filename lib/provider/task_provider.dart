import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart';

class TaskNotifier extends ChangeNotifier {
  final List<Task> _tasks = [];
  final CollectionReference tasksCollection = FirebaseFirestore.instance.collection('tasks');

  List<Task> get tasks => _tasks;

  TaskNotifier() {
    fetchTasks();
  }

  void fetchTasks() async {
    final snapshot = await tasksCollection.get();
    _tasks.clear();
    for (var doc in snapshot.docs) {
      _tasks.add(Task(
        id: doc.id,
        title: doc['title'],
        description: doc['description'],
        done: doc['done'],
      ));
    }
    notifyListeners();
  }

  void addTask(String title, String description) async {
    final newTask = Task(title: title, description: description);
    final docRef = await tasksCollection.add({
      'title': title,
      'description': description,
      'done': newTask.done,
    });
    newTask.id = docRef.id;
    _tasks.add(newTask);
    notifyListeners();
  }

  void toggleTaskDone(int index) async {
    _tasks[index].done = !_tasks[index].done;
    notifyListeners();

    final taskDoc = tasksCollection.doc(_tasks[index].id);
    await taskDoc.update({'done': _tasks[index].done});
  }

  void deleteTask(int index) async {
    if (index >= 0 && index < _tasks.length) {
      final taskDoc = tasksCollection.doc(_tasks[index].id);
      await taskDoc.delete();

      _tasks.removeAt(index);
      notifyListeners();
    } else {
      print('Invalid index: $index');
    }
  }

  void deleteallTask() async {
    for (var task in _tasks) {
      final taskDoc = tasksCollection.doc(task.id);
      await taskDoc.delete();
    }
    _tasks.clear();
    notifyListeners();
  }
}

final taskProvider = ChangeNotifierProvider((ref) => TaskNotifier());