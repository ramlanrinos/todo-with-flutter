import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String displayText = "Hello";
  List<String> taskList = [];

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Todo List",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black87,
        ),
        body: Container(
          color: Colors.grey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                          label: Text(
                            "Enter a task",
                            // style: TextStyle(color: Colors.blueGrey),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(width: 10),
                  MaterialButton(
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    height: 40,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      setState(() {
                        displayText = textController.text;
                        taskList.add(displayText);
                        textController.clear();
                        FocusScope.of(context).unfocus();
                        // print(taskList);
                      });
                    },
                    child: Text("Add"),
                  ),
                ],
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              taskList[index],
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              setState(() {
                                taskList.removeAt(index);
                              });
                            },
                            child: Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
