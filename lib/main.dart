import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void setState(VoidCallback fn) {
    
    super.setState(fn);
  }
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
          itemCount: 5,
            itemBuilder: (context, index){
              return ListTile(
                leading: Text('milk'),
                trailing: Checkbox(
                  value: false,
                  onChanged: (bool? value) {
                    setState(() {
                                  value = true;
                    });

                  },
                ),
              );
            }),
      ),
    );
  }
}
