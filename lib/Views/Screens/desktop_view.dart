import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:online_cog/Constants/variable.dart';
import 'package:online_cog/Constants/widgets.dart';
import 'package:online_cog/Database/Requests/cog_request.dart';

class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final idNumController = TextEditingController();
  final emailController = TextEditingController();

  void clearContentsofTextFields() {
    _formKey.currentState?.reset();
  }

  @override
  void dispose() {
    nameController.dispose();
    idNumController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      body: Row(children: [
        myDrawer,
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              //Form layout
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 15.0),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person_outline),
                            hintText: 'Enter your name',
                            labelText: 'Name',
                          ),
                          validator: (value) =>
                              (value == null) ? 'Enter a valid name' : null),
                      TextFormField(
                          controller: idNumController,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.account_box_outlined),
                            hintText: 'e.g 2022-00001',
                            labelText: 'Student ID number',
                          ),
                          validator: (value) => (value == null)
                              ? 'Enter a valid ID Number'
                              : null),
                      TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.email_outlined),
                            hintText: 'Enter your email address',
                            labelText:
                                'Email address (your COG will be sent to this email)',
                          ),
                          validator: (value) =>
                              (value != null && !EmailValidator.validate(value))
                                  ? 'Enter a valid email'
                                  : null),

                      //Dropdown layouts
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //department
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "Department",
                                  style: TextStyle(fontSize: 18),
                                ),
                                DropdownButton(
                                  hint: Text(department),
                                  // Down Arrow Icon
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  // Array list of items
                                  items: departmentList.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      department = newValue!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          // Year Level drop down
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "Year Level",
                                  style: TextStyle(fontSize: 18),
                                ),
                                DropdownButton(
                                  hint: Text(year.toString()),
                                  // Down Arrow Icon
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  // Array list of items
                                  items: yearLevel.map((int items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items.toString()),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (int? newValue) {
                                    setState(() {
                                      year = newValue!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          //school year drop down
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "School Year",
                                  style: TextStyle(fontSize: 18),
                                ),
                                DropdownButton(
                                  hint: Text(schoolYear),
                                  // Down Arrow Icon
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  // Array list of items
                                  items: schoolYearList.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      schoolYear = newValue!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          //semester drop down
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10.0),
                            child: Column(
                              children: [
                                const Text(
                                  "Semester",
                                  style: TextStyle(fontSize: 18),
                                ),
                                DropdownButton(
                                  hint: Text(semester),
                                  // Down Arrow Icon
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  // Array list of items
                                  items: semesterList.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      semester = newValue!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // //Dropdown layouts
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     //department
              //     Padding(
              //       padding: const EdgeInsets.symmetric(
              //           vertical: 20.0, horizontal: 10.0),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           const Text(
              //             "Department",
              //             style: TextStyle(fontSize: 18),
              //           ),
              //           DropdownButton(
              //             hint: Text(department),
              //             // Down Arrow Icon
              //             icon: const Icon(Icons.keyboard_arrow_down),
              //             // Array list of items
              //             items: departmentList.map((String items) {
              //               return DropdownMenuItem(
              //                 value: items,
              //                 child: Text(items),
              //               );
              //             }).toList(),
              //             // After selecting the desired option,it will
              //             // change button value to selected value
              //             onChanged: (String? newValue) {
              //               setState(() {
              //                 department = newValue!;
              //               });
              //             },
              //           ),
              //         ],
              //       ),
              //     ),
              //     // Year Level drop down
              //     Padding(
              //       padding: const EdgeInsets.symmetric(
              //           vertical: 20.0, horizontal: 10.0),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           const Text(
              //             "Year Level",
              //             style: TextStyle(fontSize: 18),
              //           ),
              //           DropdownButton(
              //             hint: Text(year.toString()),
              //             // Down Arrow Icon
              //             icon: const Icon(Icons.keyboard_arrow_down),
              //             // Array list of items
              //             items: yearLevel.map((int items) {
              //               return DropdownMenuItem(
              //                 value: items,
              //                 child: Text(items.toString()),
              //               );
              //             }).toList(),
              //             // After selecting the desired option,it will
              //             // change button value to selected value
              //             onChanged: (int? newValue) {
              //               setState(() {
              //                 year = newValue!;
              //               });
              //             },
              //           ),
              //         ],
              //       ),
              //     ),
              //     //school year drop down
              //     Padding(
              //       padding: const EdgeInsets.symmetric(
              //           vertical: 15.0, horizontal: 10.0),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           const Text(
              //             "School Year",
              //             style: TextStyle(fontSize: 18),
              //           ),
              //           DropdownButton(
              //             hint: Text(schoolYear),
              //             // Down Arrow Icon
              //             icon: const Icon(Icons.keyboard_arrow_down),
              //             // Array list of items
              //             items: schoolYearList.map((String items) {
              //               return DropdownMenuItem(
              //                 value: items,
              //                 child: Text(items),
              //               );
              //             }).toList(),
              //             // After selecting the desired option,it will
              //             // change button value to selected value
              //             onChanged: (String? newValue) {
              //               setState(() {
              //                 schoolYear = newValue!;
              //               });
              //             },
              //           ),
              //         ],
              //       ),
              //     ),
              //     //semester drop down
              //     Padding(
              //       padding: const EdgeInsets.symmetric(
              //           vertical: 15.0, horizontal: 10.0),
              //       child: Column(
              //         children: [
              //           const Text(
              //             "Semester",
              //             style: TextStyle(fontSize: 18),
              //           ),
              //           DropdownButton(
              //             hint: Text(semester),
              //             // Down Arrow Icon
              //             icon: const Icon(Icons.keyboard_arrow_down),
              //             // Array list of items
              //             items: semesterList.map((String items) {
              //               return DropdownMenuItem(
              //                 value: items,
              //                 child: Text(items),
              //               );
              //             }).toList(),
              //             // After selecting the desired option,it will
              //             // change button value to selected value
              //             onChanged: (String? newValue) {
              //               setState(() {
              //                 semester = newValue!;
              //               });
              //             },
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              ElevatedButton(
                onPressed: (() async {
                  if (_formKey.currentState!.validate()) {
                    var result = await FirebaseOperations.addCogRequest(
                        name: nameController.text,
                        idNumber: idNumController.text,
                        email: emailController.text,
                        schoolYear: schoolYear,
                        department: department,
                        yearLevel: year,
                        semester: semester);

                    if (result.code == 200) {
                      showAlertDialog(
                          context, "Sucess!", schoolYear, semester, '');
                    } else {
                      showAlertDialog(
                          context, "Error!", '', '', result.message!);
                    }
                  }
                  clearContentsofTextFields();
                }),
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
