import 'package:flutter/material.dart';
class CreateNewFolders extends StatefulWidget {
  @override
  State<CreateNewFolders> createState() => _CreateNewFoldersState();
}

class _CreateNewFoldersState extends State<CreateNewFolders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Folder"),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_backspace_rounded)),
      ),


    );
  }
}
