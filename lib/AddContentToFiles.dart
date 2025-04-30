import 'package:flutter/material.dart';
class AddFileContent extends StatefulWidget {
  @override
  State<AddFileContent> createState() => _AddFileContentState();
}

class _AddFileContentState extends State<AddFileContent> {

  var titleText = TextEditingController();
  var conentText = TextEditingController();
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

                trailing: ElevatedButton(
                  onPressed: () {
                    String inputTitleText = titleText.text;
                    if(inputTitleText.isEmpty)
                      {
                        print("Enter Title");
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Popup Title'),
                              content: Text('This is a simple popup window!'),
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
                  },
                  child: Text("Done"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
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
