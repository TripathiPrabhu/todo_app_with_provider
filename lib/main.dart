import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context)=>TaskData(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          primaryColor: Colors.orange,
        ),
        home: Scaffold (
          appBar: AppBar(
            title: Text('To-Do App'),
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: context.watch<TaskData>().listTask.length,
              itemBuilder: (context, index){
                return ListTile(
                  leading: Text('${context.watch<TaskData>().listTask[index].product}'),
                  trailing: Checkbox(
                    value: context.watch<TaskData>().listTask[index].isAvailble,
                    onChanged: (bool? value) {
                      context.read<TaskData>().toggle(index, value!);
                      },
                  ),
                );
              }),
        ),
    );
  }
}

class Task {
  String? product;
  bool? isAvailble;
  Task({this.product, this.isAvailble});
}

class TaskData extends ChangeNotifier{
List<Task> listTask = [
  Task(product: 'Milk', isAvailble: false),
  Task(product: 'Sugar', isAvailble: false),
  Task(product: 'Salt', isAvailble: false),
];

toggle(int index, bool value){
  listTask[index].isAvailble = value;
  notifyListeners();

}
}
