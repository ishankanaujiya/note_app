import 'package:flutter/material.dart';
import 'package:note_app/CreateFiles.dart';
class EditFileContent extends StatefulWidget {

  var fileTitle;
  var fileContent;
  String ?folderName;
  int index;
  List<List<String>> folderList = [];

  EditFileContent(this.folderName, this.fileTitle, this.fileContent, this.folderList, this.index);
  @override
  State<EditFileContent> createState() => _EditFileContentState(folderName, fileTitle, fileContent, folderList, index);
}

class _EditFileContentState extends State<EditFileContent> {

  TextEditingController titleText = TextEditingController();

  TextEditingController contentText = TextEditingController();

  List<List<String>> folderList = [];
  var fileTitle;
  var fileContent;
  String ?folderName;
  int index;

  var editedTitle;
  var editedContent;
  _EditFileContentState(this.folderName, this.fileTitle, this.fileContent, this.folderList, this.index);

  void initState()
  {
    super.initState();
    assignValues();
  }

  void assignValues()
  {

    titleText.text = fileTitle.toString();
    contentText.text = fileContent.toString();

  }

  bool isTitleDuplicate(String newTitle) {
    for (int i = 0; i < folderList.length; i++) {
      // Check if the new title matches any existing title (excluding the current one)
      if (i != index && folderList[i][0] == newTitle) {
        return true;  // Duplicate title found
      }
    }
    return false;  // No duplicate title found
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: <Widget>[

          Container(
            width: double.infinity,
            height: 100,
            color: Colors.cyan,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 25.0),

              child: ListTile(
                title: TextField(
                  controller: titleText,
                  decoration: InputDecoration(
                    hintText: "Title",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        )
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        )
                    ),
                  ),
                ),


                trailing: TextButton(
                  onPressed: () {
                    String inputTitleText = titleText.text;
                    if(inputTitleText.isEmpty)
                    {
                      print("Enter Title");
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Title Required'),
                            content: Text("Enter The Title"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  // Close the popup when the button is pressed
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    else if (isTitleDuplicate(inputTitleText)) {
                      // If the title already exists, show an alert
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(
                            "Title already exists. Choose a different name.")),
                      );
                    }
                    else
                    {
                      print("$folderName");
                      editedTitle = inputTitleText;
                      // print("The Title is: $fileTitle");
                      editedContent = contentText.text;

                      folderList[index][0] = editedTitle;
                      folderList[index][1] = editedContent;
                      print("This is FolderList $folderList");
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => CreateNewFiles(folderName, folderList, editedTitle, editedContent)

                      ));
                    }
                  },
                  child: Text("Done"),
                ),

              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              // height: 400,
              color: Colors.orange,
              child: TextField(

                controller:contentText,
                maxLines: null,
                // expands: true,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        )
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        )
                    )
                ),

              ),
            ),
          ),

        ],
      ),
    );
  }
}
