// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({Key? key}) : super(key: key);

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(value: "select", child: Text("select")),
    DropdownMenuItem(value: "Dropdown Field", child: Text("Dropdown Field")),
    DropdownMenuItem(value: "Checkbox", child: Text("Checkbox"))
  ];

  String selectedValue = "select";
  bool showDropDown = true;
  int noOfTextFields = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Flexible(
                child: Row(children: [
                  showDropDown
                      ? DropdownButton(
                          value: selectedValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue!;
                            });
                          },
                          items: menuItems)
                      : selectedValue == "Dropdown Field"
                          ? Flexible(
                              child: TextField(
                                decoration:
                                    InputDecoration(hintText: "Enter option 1"),
                              ),
                            )
                          // Expanded(
                          //     child: TextField(
                          //         decoration: InputDecoration(
                          //             hintText: "Enter drop down option")))
                          : Expanded(
                              child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Enter check element"))),
                  Visibility(
                    visible: showDropDown,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            showDropDown = !showDropDown;
                          });
                        },
                        icon: Icon(Icons.add)),
                  )
                ]),
              ),
              Visibility(
                  visible: !showDropDown,
                  child: TextButton(
                      onPressed: (() {
                        setState(() {
                          if (selectedValue != "Dropdown Field") {}
                        });
                      }),
                      child: Text("Save")))
            ])));
  }
}
