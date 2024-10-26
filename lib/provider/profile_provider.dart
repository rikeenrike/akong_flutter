// provider/profile_provider.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileNotifier extends ChangeNotifier {
  String _name = "John Doe";
  String _email = "johndoe@example.com";

  String get name => _name;
  String get email => _email;

  void updateProfile(String name, String email) {
    _name = name;
    _email = email;
    notifyListeners();
  }
}

// Define the ChangeNotifierProvider for ProfileNotifier
final profileProvider = ChangeNotifierProvider((ref) => ProfileNotifier());