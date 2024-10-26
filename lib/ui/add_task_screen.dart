import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/task_provider.dart';

class AddTaskScreen extends ConsumerWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Add Task"),
        previousPageTitle: "Back",
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoTextField(
              controller: titleController,
              placeholder: "Task Title",
            ),
            SizedBox(height: 12),
            CupertinoTextField(
              controller: descriptionController,
              placeholder: "Task Description",
            ),
            SizedBox(height: 20),
            CupertinoButton.filled(
              child: Text("Add Task"),
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty) {
                  ref.read(taskProvider).addTask(
                        titleController.text,
                        descriptionController.text,
                      );
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}