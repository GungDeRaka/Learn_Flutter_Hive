// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'contact_form.dart';
import 'models/contact.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String name = 'Noname';
  int age = 0;

  Future getBox() async {
    var contactBox = await Hive.openBox('contacts');
  }

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
getBox();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Dashboard"),
            actions: const [],
          ),
          body: FutureBuilder(
            future: getBox(),
            builder: (context, snapshot) {
              var contacts = Hive.box('contacts');
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Error pada ${snapshot.error}",
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          var contact = contacts.getAt(index);
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              child: ListTile(
                                contentPadding:
                                    EdgeInsets.only(bottom: 20, left: 24),
                                title: Text(
                                  contact.name!,
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  contact.age.toString(),
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    //TODO this is contact form
                    Flexible(
                      flex: -2,
                      child: Form(
                        key: formKey,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 12.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const SizedBox(
                                    width: 4.0,
                                  ),
                                  ContactForm(
                                    formController: nameController,
                                    hint: 'What is Your name?',
                                    label: "Name",
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  ContactForm(
                                    formController: ageController,
                                    hint: 'How old are You?',
                                    label: "Age",
                                  ),
                                  const SizedBox(
                                    width: 4.0,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueGrey,
                                ),
                                onPressed: () async {
                                  name = nameController.text;
                                  age = int.parse(ageController.text);
                                  formKey.currentState!.save();
                                  Contact newContact =
                                      Contact(name: name, age: age);
                                  contacts.add(newContact);
                                  setState(() {});
                                  nameController.clear();
                                  ageController.clear();
                                },
                                child: const Text("Save"),
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]);
            },
          )),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Hive.close();
    super.dispose();
  }
}
