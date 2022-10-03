import 'package:flutter/material.dart';
import 'package:online_cog/Constants/colors.dart';
import 'package:online_cog/Constants/dimensions.dart';
import 'package:online_cog/Constants/form_helper.dart';
import 'package:online_cog/Views/Screens/ViewContents/AdminAccess/admin_drawer.dart';
import 'package:online_cog/grade_models.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class Editor extends StatefulWidget {
  const Editor({super.key});

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GradeModels gradeModels = GradeModels();
  List grades = [];
  List<String>? fields;

  @override
  void initState() {
    super.initState();
    fields = List<String>.empty(growable: true);
    fields!.add('');
  }

  @override
  Widget build(BuildContext context) {
    var body = Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: Colors.blue),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text("NAME: "),
                Text("Email"),
                Text("Department"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text("ID NUMBER"),
                Text("School Year"),
                Text("Year Level"),
                Text("Sem"),
              ],
            )
          ]),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text("Course Code",
                      style: TextStyle(fontSize: 14, fontFamily: 'Poppins')),
                  Text("Course Title",
                      style: TextStyle(fontSize: 14, fontFamily: 'Poppins')),
                  Text("Rating",
                      style: TextStyle(fontSize: 14, fontFamily: 'Poppins')),
                ],
              ),
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: fields!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                const SizedBox(height: 5.0),
                                _addableContainers(index)
                              ],
                            );
                          }),
                      const SizedBox(height: 10),
                      Center(
                          // child: FormHelper.submitButton("Save",
                          //     btnColor: Colors.blue,
                          //     borderColor: Colors.blue, () {
                          //   addGradeToList(); // this will ensure that the last grade in the field will be added to the list
                          //   saveButtonFunc();
                          // }),
                          )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Editor",
          style: TextStyle(
            fontSize: 20,
            color: fontColor,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
      ),
      drawer:
          (getScreenWidth(context) <= tabletWidth) ? const AdminDrawer() : null,
      body: Row(
        children: [
          (getScreenWidth(context) > tabletWidth)
              ? const AdminDrawer()
              : Container(),
          Expanded(child: body),
        ],
      ),
    );
  }

  void addGradeToList() {
    //TODO add check if data is already added in the list
    if (validateFormContents()) {
      grades.add(gradeModels.toJson());
    }
  }

  void saveButtonFunc() {
    grades = grades.toSet().toList();
    print('SAVE BTN: ${grades}');
  }

  void addFieldCtr() {
    setState(() {
      fields!.add('');
      print(
          'ADD BTN: FIELDS LEN: ${fields!.length} && FINALS LEN: ${grades.length}');
      print('ADD BTN: ${grades}');
    });
  }

  void removeFieldCtr(index) {
    setState(() {
      if (fields!.length > 1) {
        fields!.removeAt(index);
      }
      print(
          'REMOVE BTN: FIELDS LEN: ${fields!.length} && FINALS LEN: ${grades.length}');
      print('REMOVE BTN: ${grades}');
    });
  }

  bool validateFormContents() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Widget _addableContainers(index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        /// [course code]
        Flexible(
            child: DynamicForm(
          keyName: 'cc_$index',
          onValidate: (value) {
            if (value.isEmpty) {
              return 'Course code $index cant\'t be empty';
            }
            return null;
          },
          onSaved: (value) {
            gradeModels.courseCode = value;
          },
        )),

        /// [course title]
        Flexible(
          child: DynamicForm(
            keyName: 'ct_$index',
            onValidate: (value) {
              if (value.isEmpty) {
                return 'Course title $index can\'t be empty';
              }
              return null;
            },
            onSaved: (value) {
              gradeModels.courseTitle = value;
            },
          ),
        ),

        /// rating or the grade
        Flexible(
          child: DynamicForm(
            keyName: 'rt_$index',
            onValidate: (value) {
              if (value.isEmpty) {
                return 'Rating $index can\'t be empty';
              }
              return null;
            },
            onSaved: (value) {
              gradeModels.rating = value;
            },
          ),
        ),

        Visibility(
          visible: index == fields!.length - 1,
          child: IconButton(
            icon: const Icon(Icons.add_circle, color: Colors.green),
            onPressed: () {
              addGradeToList();
              addFieldCtr();
            },
          ),
        ),
        Visibility(
          visible: index > 0,
          child: IconButton(
            icon: const Icon(Icons.remove_circle, color: Colors.red),
            onPressed: () {
              removeFieldCtr(index);
            },
          ),
        )
      ],
    );
  }
}
