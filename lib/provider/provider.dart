import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Providers with ChangeNotifier {
  List<String> items = [];

  Future additems(TextEditingController controller) async {
    items.add(controller.text);
    await FirebaseFirestore.instance.collection('items').add({
      'title': controller.text,
    });
    notifyListeners();
  }
}
