// provider/profile_provider.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileNotifier extends ChangeNotifier {
  String _name = "John Doe";
  String _email = "johndoe@example.com";
  final CollectionReference profileCollection = FirebaseFirestore.instance.collection('profiles');

  String get name => _name;
  String get email => _email;

  ProfileNotifier() {
    fetchProfile();
  }

  void fetchProfile() async {
    final doc = await profileCollection.doc('profile').get();
    if (doc.exists) {
      _name = doc['name'];
      _email = doc['email'];
      notifyListeners();
    }
  }

  void updateProfile(String name, String email) async {
    _name = name;
    _email = email;
    notifyListeners();

    await profileCollection.doc('profile').set({
      'name': name,
      'email': email,
    });
  }
}

final profileProvider = ChangeNotifierProvider((ref) => ProfileNotifier());