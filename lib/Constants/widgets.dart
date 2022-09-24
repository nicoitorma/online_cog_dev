import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:online_cog/Accounts/authentication.dart';
import 'package:online_cog/Constants/colors.dart';
import 'package:online_cog/Constants/variable.dart';
import 'package:online_cog/Views/Screens/ViewContents/notifications.dart';
import 'package:online_cog/Views/Screens/ViewContents/profile.dart';
import 'package:online_cog/Views/Screens/ViewContents/request_cog.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Material(
            color: Colors.blue,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DrawerHeader(
                    child: Image.asset("assets/images/cict_logo.png"),
                  ),
                  menuItem(
                    title: "Request COG",
                    icon: Icons.feed_outlined,
                    onClicked: () => itemSelected(context, 0),
                  ),
                  menuItem(
                    title: "Notifications",
                    icon: Icons.notifications_outlined,
                    onClicked: () => itemSelected(context, 1),
                  ),
                  menuItem(
                    title: "Profile",
                    icon: Icons.person_outline,
                    onClicked: () => itemSelected(context, 2),
                  ),
                  menuItem(
                      title: "Sign out",
                      icon: Icons.logout_outlined,
                      onClicked: () => itemSelected(context, 3))
                ],
              ),
            )));
  }

  /// this will return a menu item for the navigation drawer
  Widget menuItem(
      {required String title,
      required IconData icon,
      VoidCallback? onClicked}) {
    return ListTile(
      leading: Icon(icon, color: fontColor),
      title: Text(
        title,
        style: const TextStyle(color: fontColor),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void itemSelected(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const RequestCog()));
        break;
      case 1:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Notifications()));
        break;
      case 2:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Profile()));
        break;
      case 3:
        FlutterFireUIAuth.signOut();
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Authentication()));
        break;
    }
  }
}

void showAlertDialog(BuildContext context, String title, String? schoolYear,
    String? semester, String? contents) {
  showDialog(
    context: context,
    builder: ((context) => AlertDialog(
          title: Text(title),
          content: Text(
              "Your request of COG for school year $schoolYear, semester $semester \nhas been submitted."),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK")),
          ],
        )),
  );
}

class DeptDropDown extends StatefulWidget {
  const DeptDropDown({super.key});

  @override
  State<DeptDropDown> createState() => _DeptDropDownState();
}

class _DeptDropDownState extends State<DeptDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
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
    );
  }
}

class YearLvlDropDown extends StatefulWidget {
  const YearLvlDropDown({super.key});

  @override
  State<YearLvlDropDown> createState() => _YearLvlDropDownState();
}

class _YearLvlDropDownState extends State<YearLvlDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
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
    );
    //school year drop down
  }
}

class SchoolYearDropDown extends StatefulWidget {
  const SchoolYearDropDown({super.key});

  @override
  State<SchoolYearDropDown> createState() => _SchoolYearDropDownState();
}

class _SchoolYearDropDownState extends State<SchoolYearDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
    );
  }
}

class SemDropDown extends StatefulWidget {
  const SemDropDown({super.key});

  @override
  State<SemDropDown> createState() => _SemDropDownState();
}

class _SemDropDownState extends State<SemDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
    );
  }
}
