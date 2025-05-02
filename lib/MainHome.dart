import 'package:flutter/material.dart';
import 'package:note_app/AddContentToFiles.dart';
import 'package:note_app/CreateFiles.dart';
import 'package:note_app/CreateFolders.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Home extends StatefulWidget {
  List<String> folderName = [];
  Home(this.folderName);
  @override
  State<Home> createState() => _HomeState(folderName);
}

class _HomeState extends State<Home> {
  double floatingActionButtonWidth = 100;
  double floatingActionButtonHeight = 60;
  bool clickCheck = false;
  List<List<String>> folderList = [];

  List<String> folderName = [];
  _HomeState(this.folderName);

  var folderNameLength = 0;

  String titleText = "";
  var contentText;

  static const KEYFORFOLDERNAME = "foldername";

  List<String> storedFolderName = [];

void initState()
{
  super.initState();
  //addValueToTheList();
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

void addValueToTheList()
{
  folderList.clear();
  for(var i = 0; i<folderName.length; i++)
    {
      folderList.add([]);

    }
  print("The Length is: ${folderList.length}");
  folderList[0].add("1");
  folderList[0].add("2");
  folderList[0].add("3");
  folderList[0].add("4");
  // folderList[1].add("4");
  // folderList[1].add("4");
  // folderList[1].add("4");
  // folderList[1].add("4");

  for(var i =0; i<folderList.length; i++)
    {

      print(folderList[i]);
      print(folderList[0][2]);
    }
}





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Welcome"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu)
          ),

        ],
      ),

        body: Padding(
          padding: EdgeInsets.only(top: 20, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(

              folderName.length,
                  (index) => InkWell(
                    onTap: () {
                      String values = folderName[index];
                      print(index);
                      print(values);
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => CreateNewFiles(values, folderList, titleText, contentText)
                      ));
                    },
                    child: Container(
                    width: 170,
                    height: 200,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: <Widget>[

                           Text("Title: ${folderName[index]}", style: TextStyle(fontWeight: FontWeight.bold)),
                           Icon(Icons.menu),
                         ],
                       ),

                        Text("Date"),
                      ],
                    ),
                                    ),
                  ),
              ),
            ),
          ),
        ),

      floatingActionButton: SizedBox(
        width: floatingActionButtonWidth,
        height: floatingActionButtonHeight,
        child: FloatingActionButton(
          onPressed: () {

            clickCheck = !clickCheck;
            setState(() {
              AddButton();
              if(clickCheck) {
                floatingActionButtonWidth = 60.0;
                floatingActionButtonHeight = 150.0;
              }
              else
                {
                  floatingActionButtonWidth = 100.0;
                  floatingActionButtonHeight = 60.0;
                }
            });
          },
          child: classDetector(clickCheck),
        ),
      ),
    );
  }
}

Widget classDetector(var clickCheck)
{
  if(clickCheck)
    {
      return AddButton();
    }
  return Text("Add");
}

class AddButton extends StatelessWidget {

  bool clickCheck = false;
  //AddButton(this.clickCheck);

  String folderName = "Default";
  List<List<String>> folderList = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // Icon(Icons.folder),
          // Icon(Icons.file_open),
          IconButton(
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => CreateNewFolders()
                ));
              },
              icon: Icon(Icons.folder),
          ),
          IconButton(
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => AddFileContent(folderName, folderList)
                ));
              },
              icon: Icon(Icons.file_open),
          ),
        ],
      ),
    );
  }
}

