import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.deepPurple,
          accentColor: Colors.orange),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List todos = [];
  String input = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todos.add("This is my work");
    todos.add("This is my 2work");
    todos.add("This is my 3work");
    todos.add("This is my 4work");
    todos.add("This is my 5work");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context,
           builder: (BuildContext context){
            return AlertDialog(
               title: Text("Add Todos"),
               content: TextField(
                 onChanged: (String value){
                   input = value;
                 },
               ),
            );
           });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: todos[index],
              child: Card(
                child: ListTile(
                  title: Text(todos[index]),
                ),
              ),
            );
          }),
    );
  }
}
