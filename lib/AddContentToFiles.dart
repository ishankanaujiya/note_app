import 'package:flutter/material.dart';
import 'package:note_app/CreateFiles.dart';
class AddFileContent extends StatefulWidget {
  String ?folderName;
  List<List<String>> folderList = [];
  AddFileContent(this.folderName, this.folderList);
  @override
  State<AddFileContent> createState() => _AddFileContentState(folderName, folderList);
}

class _AddFileContentState extends State<AddFileContent> {

  var titleText = TextEditingController();

  var contentText = TextEditingController();

  String ?folderName;
  List<List<String>> folderList = [];
  String ?fileTitle;
  String ?fileContent;

  _AddFileContentState(this.folderName, this.folderList);
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
                      else
                        {
                          print("$folderName");
                          fileTitle = inputTitleText;
                          print("The Title is: $fileTitle");
                          fileContent = contentText.text;
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => CreateNewFiles(folderName, folderList, fileTitle, fileContent)

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

                controller: contentText,
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
