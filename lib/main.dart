import 'package:flutter/material.dart';
import 'package:note_app/AddContentToFiles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'MainHome.dart';
//import 'CreateFolders.dart';
void main() {
  List<String> folderName = ["Value"];
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(folderName),

    // home: AddFileContent(),
  ));
}
