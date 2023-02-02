import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

import 'home_contact_page.dart';
//TODO 1: add hive, hive_flutter, and path_provider (in dependencies)
//TODO 1: hive_generator, and build_runner (in dev_dependencies)

void main() async {
  runApp(const MyApp());
  //TODO 2= add
  final appDocDir = await pathProvider.getApplicationDocumentsDirectory();

  Hive.init(appDocDir.path);

  var mainStorage = await Hive.openBox('mainStorage');
  // path provider (import as pathProvider)
  // (tipe future)await getAppDocDir();
  //hive.init(pathDir)
  
  // add open box
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
// add var to use the opeed box
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
