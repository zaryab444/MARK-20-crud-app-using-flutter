import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(

  debugShowCheckedModeBanner: false,
  theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      accentColor: Colors.orange),


  home: MyApp(),

));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List todos = []; //create array of item

  String input = ""; // user input any task list in input feild

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // todos.add("Item1");
    // todos.add("Item2");
    // todos.add("Item3");
    // todos.add("Item4");
    // todos.add("Item5");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Todos App'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                title: Text('Add to list'),
                // backgroundColor: Colors.red,
                content: TextField(onChanged:(String value){
                  input = value;
                },
                ),
                actions: <Widget>[
                  FlatButton(
                      onPressed:(){
                        setState(() {
                          todos.add(input);
                          todos.sort(); //sorting the list of alphabatical order
                        });
                        Navigator.of(context).pop();// this line when you add in alert box than press button it dissapear
                      } ,
                      child: Text("Add")),

                ],
              );
            });
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),

        body: ListView.builder(  //list view show the task of list in list view format
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index){


            return Dismissible(

              key: UniqueKey(), onDismissed: (direction){ setState(() {
              todos.removeAt(index);
            });},

              child: Card(//Dismissible is use because you remove the list array in simulator
                elevation: 4,
                margin: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),

                ),
                color: Colors.green,


                child: ListTile(

                  title: Text(todos[index]), //they add a task list text in card


                  trailing: IconButton(

                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,

                    ),
                    onPressed: (){
                      setState(() {
                        todos.removeAt(index);
                      });
                    },

                  ),




                ),

              ),

            );
          },



        ) );

  }
}





