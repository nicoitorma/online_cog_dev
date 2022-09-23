import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:online_cog/Constants/string_constants.dart';
import 'package:online_cog/Constants/variable.dart';
import 'package:online_cog/Constants/widgets.dart';
import 'package:online_cog/Database/Requests/cog_request.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final idNumController = TextEditingController();
  final emailController = TextEditingController();

  void clearContentsofTextFields() {
    _formKey.currentState?.reset();
    nameController.clear();
    idNumController.clear();
    emailController.clear();
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
      appBar: AppBar(
        title: const Text(appBarTitle),
      ),
      drawer: myDrawer,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Form
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              child: Form(
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
                        validator: (value) =>
                            (value == null) ? 'Enter a valid ID Number' : null),
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
                  ],
                ),
              ),
            ),
            //Dropdown dept
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
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
            //drop down year level
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
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
            //Dropdown School year
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
            //Dropdown Semester
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
            //Submit Button
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
              child: ElevatedButton(
                onPressed: (() async {
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
                        context, "Sucess", schoolYear, semester, '');
                  } else {
                    showAlertDialog(context, "Error", '', '', result.message!);
                  }
                  clearContentsofTextFields();
                }),
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
