import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_cog/Constants/colors.dart';
import 'package:online_cog/Constants/dimensions.dart';
import 'package:online_cog/Views/Screens/ViewContents/AdminAccess/admin_drawer.dart';

class Requests extends StatefulWidget {
  const Requests({super.key});

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  final Stream<QuerySnapshot> requestsStream =
      FirebaseFirestore.instance.collection('cog_requests').snapshots();

  var cardTextStyle = const TextStyle(fontSize: 14, fontFamily: 'Poppins');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Requests of Certificate of Grades",
              style: TextStyle(
                fontSize: 20,
                color: fontColor,
                fontFamily: 'Poppins',
              )),
          centerTitle: true),
      drawer:
          (getScreenWidth(context) <= tabletWidth) ? const AdminDrawer() : null,
      body: Row(
        children: [
          (getScreenWidth(context) > tabletWidth)
              ? const AdminDrawer()
              : Container(),
          Expanded(
            child: StreamBuilder(
              stream: requestsStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text(
                      'Something went wrong! Unable to retrieve live feed');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Loading...",
                      style: TextStyle(fontSize: 18, fontFamily: 'Poppins'),
                    ),
                  );
                }

                return Container(
                  alignment: Alignment.topCenter,
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          (getScreenWidth(context) < tabletWidth) ? 2 : 4,
                    ),
                    children: snapshot.data!.docs
                        .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return Container(
                            margin: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 109, 186, 248),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  autoSizeTextWidget(
                                      text: 'Name: ${data['name']}'),
                                  autoSizeTextWidget(
                                      text: 'ID Number: ${data['idNumber']}'),
                                  autoSizeTextWidget(
                                      text: 'Email: ${data['email']}'),
                                  autoSizeTextWidget(
                                      text: 'Dept: ${data['department']}'),
                                  autoSizeTextWidget(
                                      text: 'SY: ${data['schoolYear']}'),
                                  autoSizeTextWidget(
                                      text: 'Semester: ${data['semester']}'),
                                  autoSizeTextWidget(
                                      text: 'Year level: ${data['yearLevel']}'
                                          .toString())
                                ]),
                          );
                        })
                        .toList()
                        .cast(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget autoSizeTextWidget({required String text}) {
    return AutoSizeText(text,
        maxLines: 2, minFontSize: 11, maxFontSize: 16, style: cardTextStyle);
  }
}
