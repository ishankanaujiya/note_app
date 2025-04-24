import 'package:flutter/material.dart';
import 'package:note_app/MainHome.dart';
class CreateNewFiles extends StatefulWidget {

  String ?folderName;
  List<List<String>> folderList = [];


  CreateNewFiles(this.folderName, this.folderList);
  @override
  State<CreateNewFiles> createState() => _CreateNewFilesState(folderName,folderList);
}

class _CreateNewFilesState extends State<CreateNewFiles> {
  List<String> folderName = ["values"];
  List<String> folderNameHolder = [];
  bool addFolderClickCheck = false;


  var folderNameInput = TextEditingController();

  String ?folderNameForAppBar;
  List<List<String>> folderList = [];


  _CreateNewFilesState(this.folderNameForAppBar, this.folderList);

  void initState()
  {
    super.initState();
    displayValues();
  }

  void displayValues()
  {
    folderList[0].add("1");
    folderList[0].add("2");
    folderList[0].add("3");
    folderList[0].add("4");
    print(folderList);
  }


  @override
  @override
  Widget build(BuildContext context) {
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
                  Container(

                  ),

            ],
          ),
        ),
      ),

      floatingActionButton: SizedBox(
        
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              addFolderClickCheck = true;
            });
          },
        child: Icon(Icons.add),
        ),
      ),
    );
  }
}

