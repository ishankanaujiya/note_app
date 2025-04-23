import 'package:flutter/material.dart';
class CreateNewFolders extends StatefulWidget {
  @override
  State<CreateNewFolders> createState() => _CreateNewFoldersState();
}

class _CreateNewFoldersState extends State<CreateNewFolders> {
  List<String> folderName = [];
  bool addFolderClickCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Folder"),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_backspace_rounded)),
      ),

      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            addFolderClickCheck ? FolderForm() :
            SizedBox(
              width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        addFolderClickCheck = true;
                      });

                    },
                    child: Text("Add Folders"),
                ),
            ),
          ],
        ),
      ),

    );
  }
}

class FolderForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 400,
            height: 400,
            color: Colors.cyan,
            child: Column(
              children: [
                Container(
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text("Folder Name"),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: () {}, child: Text("Done")),
              ],
            ),


          ),
        ),
      ],
    );
  }
}


