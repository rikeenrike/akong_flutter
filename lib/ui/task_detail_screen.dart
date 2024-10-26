import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/task_provider.dart';

class TaskDetailScreen extends ConsumerWidget {
  final int taskIndex;

  TaskDetailScreen({required this.taskIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskProviderInstance = ref.watch(taskProvider);
    final task = taskProviderInstance.tasks[taskIndex];

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Task Details"),
        previousPageTitle: "Back",
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              task.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              task.description,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            CupertinoButton(
              color: task.done ? CupertinoColors.systemGrey : CupertinoColors.activeGreen,
              child: Text(task.done ? "Mark as Incomplete" : "Mark as Done"),
              onPressed: () {
                ref.read(taskProvider).toggleTaskDone(taskIndex);
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}