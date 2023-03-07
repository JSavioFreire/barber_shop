import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DbProvider extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;

  List listService = [];


  
}
