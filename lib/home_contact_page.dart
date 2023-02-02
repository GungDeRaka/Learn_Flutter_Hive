// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import 'models/contact.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contact> contacts = [];
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String name = 'Noname';
  int age = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
          actions: const [],
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) => Padding(
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
                        contentPadding: EdgeInsets.only(bottom: 20,left: 24),
                        title: Text(
                          contacts[index].name!,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          contacts[index].age.toString(),
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(
                              width: 4.0,
                            ),
                            Container(
                              width: size.width * 0.4,
                              child: TextFormField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  labelText: 'Name',
                                  labelStyle: TextStyle(
                                    color: Colors.blueGrey,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  hintText: "What's your name?",
                                ),
                                // onSaved: (newValue) {
                                  
                                //   name = newValue!;
                                //   print(name);
                                
                                // },
                              ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Container(
                              width: size.width * 0.4,
                              child: TextFormField(
                                controller: ageController,
                                decoration: const InputDecoration(
                                  labelText: 'Age',
                                  labelStyle: TextStyle(
                                    color: Colors.blueGrey,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  hintText: "How old are you?",
                                ),
                                // onSaved: (newValue) {
                                //   age = int.parse(newValue ?? '0');
                                //   print(age);
                               
                                // },
                                  
                              ),
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
                          onPressed: () async{
                            name = nameController.text;
                            age = int.parse(ageController.text);
                            formKey.currentState!.save();
                            Contact newContact = Contact(name: name, age: age);
                            contacts.add(newContact);
                            setState(() {});
                            print(contacts);
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
            ]),
        // bottomNavigationBar: BottomAppBar(
        //   ),
      ),
    );
  }
}
