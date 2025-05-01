import 'package:flutter/material.dart';
import 'package:note_app/AddContentToFiles.dart';
import 'package:note_app/EditFiles.dart';
import 'package:note_app/MainHome.dart';
class CreateNewFiles extends StatefulWidget {

  String ?folderName;
  List<List<String>> folderList = [];
  String ?titleText;
  var contentText;

  CreateNewFiles(this.folderName, this.folderList, this.titleText, this.contentText);
  @override
  State<CreateNewFiles> createState() => _CreateNewFilesState(folderName,folderList, titleText, contentText);
}

class _CreateNewFilesState extends State<CreateNewFiles> {
  List<String> folderName = ["values"];
  List<String> folderNameHolder = [];
  bool addFolderClickCheck = false;


  var folderNameInput = TextEditingController();

  String ?folderNameForAppBar;
  List<List<String>> folderList = [["Default"]];
  var titleText;
  var contentText;


  List<String> titles = [];
  _CreateNewFilesState(this.folderNameForAppBar, this.folderList, this.titleText, this.contentText);

  void initState()
  {
    super.initState();

    // displayValues();
    checkTitle();
  }

  void displayValues()
  {
    folderList[0].add("1");
    folderList[0].add("2");
    folderList[0].add("3");
    folderList[0].add("4");
    print(folderList);
  }


  void checkTitle() {
    print("The Title is $titleText");

    if (titleText != null && titleText.toString().trim().isNotEmpty) {
      // Create a new list for this folder: [title, content]
      List<String> newFolder = [titleText.toString(), contentText?.toString() ?? ""];

      setState(() {
        folderList.add(newFolder);
      });


      print(folderList);
      print(folderList.length);
      print(folderList[0]); // This will be the title of the first folder
      print(folderList[0][0]); // This will be the title of the first folder
    } else {
      print("Null Title");
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    print("This is build function");
    return Scaffold(
      appBar: AppBar(
        title: Text("$folderNameForAppBar"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            //Navigator.pop(context);
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => Home(folderName)
            ));
          },
          icon: Icon(Icons.keyboard_backspace_rounded),
        ),
      ),

      body: SingleChildScrollView(
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   // mainAxisAlignment: MainAxisAlignment.center,
        //   children: [

            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 20.0),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(

                  folderList.length,
                    (index) => InkWell(
                      onTap: () {
                        var fileTitle = folderList[index][0].toString();
                        var fileContent = folderList[index][1].toString();
                        print(index);
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => EditFileContent(folderNameForAppBar, fileTitle, fileContent, folderList, index)
                        ));
                      },

                      child: Container(
                        width: 180,
                        height: 150,
                        // child: Text("${folderList[index][0]}"),
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(10),

                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text("${folderList[index][0]}", style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                    ),
                                    Text("Date: ", style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  ],
                                ),
                            ),
                            // Text("Date: "),
                          ],
                        ),


                      ),
                    ),
                ),
              ),
            ),
            // Container(
            //   height: 400,
            //   color: Colors.cyan,
            //   child: ListView.builder(itemBuilder: (context,index) {
            //     return Container(
            //       child: Text("${folderName[index]}"),
            //     );
            //   },
            //     itemCount: folderName.length,
            //   ),
            // ),


            // SizedBox(
            //   height: 40,
            // ),
            // for(var i = 0; i<folderName.length; i++)
            //   Padding(
            //     padding: const EdgeInsets.only(bottom: 10.0, left: 20.0),
            //     child: Container(
            //       width: double.infinity,
            //
            //       child: Text("${folderName[i]}", style: TextStyle(
            //         fontSize: 40,
            //
            //       ),),
            //     ),
            //   ),

            // addFolderClickCheck ? Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     width: 400,
            //
            //
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Container(
            //           width: double.infinity,
            //           child: TextField(
            //             controller: folderNameInput,
            //             decoration: InputDecoration(
            //               label: Text("Folder Name"),
            //             ),
            //           ),
            //         ),
            //
            //         SizedBox(
            //           height: 20,
            //         ),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             SizedBox(
            //               width: 200,
            //               height: 50,
            //               child: ElevatedButton(
            //                 onPressed: () {
            //                   folderName.add(folderNameInput.text);
            //                   setState(() {
            //                     addFolderClickCheck = false;
            //                     folderNameInput.clear();
            //                   });
            //
            //                 },
            //                 child: Text("Done"),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //
            //
            //   ),
            // ) :
            //     Container(
            //
            //     ),
        //
        //   ],
        // ),
      ),

      floatingActionButton: SizedBox(

        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              addFolderClickCheck = true;
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => AddFileContent(folderNameForAppBar, folderList)
              ));
            });
          },
        child: Icon(Icons.add),
        ),
      ),
    );
  }
}

