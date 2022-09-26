import 'package:flutter/material.dart';
import 'package:online_cog/Constants/colors.dart';
import 'package:online_cog/Constants/dimensions.dart';
import 'package:online_cog/Views/Screens/ViewContents/AdminAccess/admin_drawer.dart';

class Editor extends StatefulWidget {
  const Editor({super.key});

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  @override
  Widget build(BuildContext context) {
    final rows = <TableRow>[];

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
          Expanded(
            child: Table(
                border: TableBorder.all(),
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(),
                  1: FlexColumnWidth(),
                  2: FlexColumnWidth(),
                  3: FlexColumnWidth(),
                  4: FlexColumnWidth(),
                  5: FlexColumnWidth(),
                  6: FlexColumnWidth(),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: const <TableRow>[
                  TableRow(
                    children: <Widget>[
                      Center(child: Text("Year/Sem")),
                      Center(child: Text("Course Code")),
                      Center(child: Text("Course Title")),
                      Center(child: Text("Rating")),
                      Center(child: Text("Removal")),
                      Center(child: Text("Units")),
                      Center(child: Text("Weighted Average")),
                    ],
                  ),
                ]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_outlined),
      ),
    );
  }
}
