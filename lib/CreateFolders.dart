import 'package:flutter/material.dart';
import 'package:note_app/MainHome.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CreateNewFolders extends StatefulWidget {
  @override
  State<CreateNewFolders> createState() => _CreateNewFoldersState();
}

class _CreateNewFoldersState extends State<CreateNewFolders> {
  List<String> folderName = ["values"];
  List<String> folderNameHolder = [];
  bool addFolderClickCheck = false;

  static const KEYFORFOLDERNAME = "foldername";

  List<String> storedFolderName = [];

  var folderNameInput = TextEditingController();

  void initState()
  {
    super.initState();

    getFolderName();
  }

  void getFolderName() async
  {
    print("This is Init Method");
    var pref = await SharedPreferences.getInstance();

    storedFolderName = pref.getStringList(KEYFORFOLDERNAME) ?? ["Default"];

    print("The Stored Folder Name is: $storedFolderName");
    folderName.clear();

    folderName.addAll(storedFolderName);
    print("The Folder Name from Init Method is: $folderName");

    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {


    print("The Folder Name from Build Method is: $folderName");
    return Scaffold(
      appBar: AppBar(
        title: Text("Folder"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () async {
              var pref = await SharedPreferences.getInstance();

              pref.setStringList(KEYFORFOLDERNAME, folderName);

              print("Value Stored Locally");

              //Navigator.pop(context);
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => Home(folderName)
              ));
            },
            icon: Icon(Icons.keyboard_backspace_rounded),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
        
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


              SizedBox(
                height: 40,
              ),

              for(var i = 0; i<folderName.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, left: 20.0),
                  child: Container(
                    width: double.infinity,

                    child: Text("${folderName[i]}", style: TextStyle(
                      fontSize: 40,

                    ),),
                  ),
                ),


              addFolderClickCheck ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 400,
        
        
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        child: TextField(
                          controller: folderNameInput,
                          decoration: InputDecoration(
                            label: Text("Folder Name"),
                          ),
                        ),
                      ),
        
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {
                                  folderName.add(folderNameInput.text);
                                  setState(() {
                                    addFolderClickCheck = false;
                                    folderNameInput.clear();
                                  });

                                },
                                child: Text("Done"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
        
        
                ),
              ) :
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 40.0),
                child: SizedBox(
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
              ),
            ],
          ),
        ),
      ),

    );
  }
}

