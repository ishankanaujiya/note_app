import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double floatingActionButtonWidth = 100;
  double floatingActionButtonHeight = 60;
  bool clickCheck = false;
  List<List<String>> folderList = [["Default"]];
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
                60,
                  (index) => Container(
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

                         Text("Title $index", style: TextStyle(fontWeight: FontWeight.bold)),
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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // Icon(Icons.folder),
          // Icon(Icons.file_open),
          IconButton(onPressed: (){}, icon: Icon(Icons.folder)),
          IconButton(onPressed: (){}, icon: Icon(Icons.file_open)),
        ],
      ),
    );
  }
}

