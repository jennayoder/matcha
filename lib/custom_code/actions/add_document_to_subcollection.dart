// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addDocumentToSubcollection(
  String collectionPath,
  String documentId,
  String subcollectionName,
  String actionName,
) async {
  final CollectionReference subcollection = FirebaseFirestore.instance
      .collection(collectionPath)
      .doc(documentId)
      .collection(subcollectionName);

  await subcollection.add({
    'name': actionName,
    'checks': ['init', 'check2'],
    'timeCreated': Timestamp.now(),
    'state': 'dummy',
  }).then((value) {
    print(
        'New document added to $subcollectionName subcollection with ID: ${value.id}');
  }).catchError((error) {
    print(
        'Error adding new document to $subcollectionName subcollection: $error');
  });
}
