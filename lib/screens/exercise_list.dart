import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lisp_sync/constants.dart';

class ExerciseListPage extends StatefulWidget {
  var exercises = ["Âm vị", "Từ đơn", "Từ 2 âm tiết", "Câu văn", "Đoạn văn"];
  @override
  _ExerciseListPageState createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends State<ExerciseListPage> {
  List<bool> isExpandedList;
  @override
  void initState() {
    isExpandedList = widget.exercises.map((e) => false).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color.fromRGBO(82, 95, 127, 1),
        ),
        title: Text(
          "Danh sách bài học",
          style: TextStyle(
            color: Color.fromRGBO(82, 95, 127, 1),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ExpansionPanelList(
              expandedHeaderPadding: EdgeInsets.zero,
              expansionCallback: (index, isExpanded) {
                setState(() {
                  print(isExpanded);
                  isExpandedList[index] = !isExpanded;
                });
              },
              children: widget.exercises
                  .map(
                    (exercise) => ExpansionPanel(
                        canTapOnHeader: false,
                        headerBuilder: (context, isExpanded) => Container(
                              height: height(context) * 0.1,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width(context) * 0.1,
                                  ),
                                  Text(
                                    "Bài" +
                                        (widget.exercises.indexOf(exercise) + 1)
                                            .toString() +
                                        ":",
                                    style: TextStyle(
                                        color: Color.fromRGBO(82, 95, 127, 1),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    width: width(context) * 0.05,
                                  ),
                                  Text(
                                    exercise,
                                    style: TextStyle(
                                        color: Color.fromRGBO(82, 95, 127, 1),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                        isExpanded:
                            isExpandedList[widget.exercises.indexOf(exercise)],
                        body: ListView(
                          shrinkWrap: true,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "cachPhatAm");
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromRGBO(82, 95, 127, 1),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: width(context) * 0.4,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color.fromRGBO(40, 20, 131, 1),
                                            Color.fromRGBO(215, 130, 217, 1)
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 100,
                                        child: Center(
                                          child: Text(
                                            "Cách phát âm L - N",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    82, 95, 127, 1),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "tudon");
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromRGBO(82, 95, 127, 1),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: width(context) * 0.4,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color.fromRGBO(40, 20, 131, 1),
                                            Color.fromRGBO(215, 130, 217, 1)
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 100,
                                        child: Center(
                                          child: Text(
                                            "Từ Đơn Với L",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    82, 95, 127, 1),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
