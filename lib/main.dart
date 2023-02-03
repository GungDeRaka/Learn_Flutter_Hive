
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

  var contactsBox = await Hive.openBox('contacts');
  //? to use the opened box, u can add it into all of the classes that need
  //? the data form the contacts box like /// [openedBox]
  // path provider (import as pathProvider)
  // (tipe future)await getAppDocDir();
  //hive.init(pathDir)
  
  // add open box
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final openedBox = Hive.box('contacts');
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
