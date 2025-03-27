import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                  width: 180,
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

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("Add"),
      ),
    );
  }
}
