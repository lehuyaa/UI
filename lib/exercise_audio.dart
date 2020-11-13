import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lisp_sync/constants.dart';
import 'package:lisp_sync/practice.dart';

class ExerciseAudioPage extends StatefulWidget {
  final words = [
    "Lừa",
    "Lúa",
    "Lọc",
    "Lành",
    "Lửa",
    "Lấp",
  ];

  @override
  _ExerciseAudioPageState createState() => _ExerciseAudioPageState();
}

class _ExerciseAudioPageState extends State<ExerciseAudioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Container(
              height: height(context),
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
              child: Column(
                children: [
                  SizedBox(
                    height: height(context) * 0.15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    width: width(context) * 0.8,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text:
                            "Nghe phát âm đúng, ghi âm lại phát âm của bạn và so sánh với nhau",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: widget.words.length,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.only(
                          left: width(context) * 0.1,
                          bottom: 20,
                          right: width(context) * 0.1,
                        ),
                        leading: FlatButton(
                          shape: CircleBorder(
                            side: BorderSide(
                                color: Color.fromRGBO(40, 20, 131, 0.8),
                                width: 3),
                          ),
                          child: Icon(
                            Icons.play_circle_outline,
                            color: Color.fromRGBO(40, 20, 131, 1),
                          ),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        title: Text(
                          widget.words[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Container(
                          width: width(context) * 0.4,
                          child: ButtonBar(
                            children: [
                              FlatButton(
                                shape: CircleBorder(
                                  side: BorderSide(
                                      color: Color.fromRGBO(40, 20, 131, 0.8),
                                      width: 3),
                                ),
                                child: Icon(
                                  Icons.account_circle,
                                  color: Colors.red,
                                  size: 15,
                                ),
                                color: Colors.white,
                                onPressed: () {},
                              ),
                              FlatButton(
                                shape: CircleBorder(
                                  side: BorderSide(
                                      color: Color.fromRGBO(40, 20, 131, 0.8),
                                      width: 3),
                                ),
                                child: Icon(
                                  Icons.play_circle_outline,
                                  color: Color.fromRGBO(40, 20, 131, 1),
                                ),
                                color: Colors.white,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: height(context) * 0.1,
                  ),
                  FlatButton(
                    onPressed: () {
                      print("true");
                      Navigator.pushNamed(context, "luyentap");
                    },
                    child: Text(
                      "Kết Thúc",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    color: Colors.white,

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ],
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                "Luyện tập",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
