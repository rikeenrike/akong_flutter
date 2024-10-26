// ui/profile_screen.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/profile_provider.dart';
import '../provider/theme_notifier.dart';

class ProfileScreen extends ConsumerWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final brightness = ref.watch(themeNotifierProvider);

    // Pre-fill text fields with the current profile data
    nameController.text = profile.name;
    emailController.text = profile.email;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Profile"),
        previousPageTitle: "Back",
        trailing: CupertinoSwitch(
          value: brightness == Brightness.dark,
          onChanged: (value) {
            ref.read(themeNotifierProvider.notifier).toggleTheme();
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Profile Information",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            CupertinoTextField(
              controller: nameController,
              placeholder: "Name",
            ),
            SizedBox(height: 12),
            CupertinoTextField(
              controller: emailController,
              placeholder: "Email",
            ),
            SizedBox(height: 20),
            CupertinoButton.filled(
              child: Text("Update Profile"),
              onPressed: () {
                ref.read(profileProvider).updateProfile(
                      nameController.text,
                      emailController.text,
                    );
                // Optionally pop the screen after updating
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}