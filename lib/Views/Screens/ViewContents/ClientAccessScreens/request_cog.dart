import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:online_cog/Constants/colors.dart';
import 'package:online_cog/Constants/dimensions.dart';
import 'package:online_cog/Constants/variable.dart';
import 'package:online_cog/Constants/widgets.dart';
import 'package:online_cog/Database/Requests/cog_request.dart';
import 'package:online_cog/Views/Screens/ViewContents/ClientAccessScreens/nav_drawer.dart';

class RequestCog extends StatefulWidget {
  const RequestCog({super.key});

  @override
  State<RequestCog> createState() => _RequestCogState();
}

class _RequestCogState extends State<RequestCog> {
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
      appBar: AppBar(
          title: const Text("Request Certificate of Grades",
              style: TextStyle(
                fontSize: 20,
                color: fontColor,
                fontFamily: 'Poppins',
              )),
          centerTitle: true),
      drawer:
          (getScreenWidth(context) <= tabletWidth) ? const MyDrawer() : null,
      body: Row(
        children: [
          (getScreenWidth(context) > tabletWidth)
              ? const MyDrawer()
              : Container(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                                  validator: (value) => (value == null)
                                      ? 'Enter a valid name'
                                      : null),
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
                                  validator: (value) => (value != null &&
                                          !EmailValidator.validate(value))
                                      ? 'Enter a valid email'
                                      : null),
                              //Dropdown layouts
                              (getScreenWidth(context) <= mobileWidth)
                                  ? Align(
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: const [
                                          //department
                                          DeptDropDown(),
                                          // Year Level drop down
                                          YearLvlDropDown(),
                                          //School Year drop down
                                          SchoolYearDropDown(),
                                          // semester drop down
                                          SemDropDown()
                                        ],
                                      ),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        //department
                                        DeptDropDown(),
                                        // Year Level drop down
                                        YearLvlDropDown(),
                                        //School Year drop down
                                        SchoolYearDropDown(),
                                        // semester drop down
                                        SemDropDown()
                                      ],
                                    ),

                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 30.0, horizontal: 10.0),
                                  child: ElevatedButton(
                                    onPressed: (() async {
                                      if (_formKey.currentState!.validate()) {
                                        var result = await FirebaseOperations
                                            .addCogRequest(
                                                name: nameController.text,
                                                idNumber: idNumController.text,
                                                email: emailController.text,
                                                schoolYear: schoolYear,
                                                department: department,
                                                yearLevel: year,
                                                semester: semester);

                                        if (result.code == 200) {
                                          showAlertDialog(context, "Success!",
                                              schoolYear, semester, '');
                                        } else {
                                          showAlertDialog(context, "Error!", '',
                                              '', result.message!);
                                        }
                                      }
                                      clearContentsofTextFields();
                                    }),
                                    child: const Text(
                                      'Submit',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                            ])),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
