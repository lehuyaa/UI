import 'package:flutter/material.dart';

import 'constants.dart';
import 'model/question.dart';

class questionPage extends StatefulWidget {
  @override
  _questionPageState createState() => _questionPageState();
}

class _questionPageState extends State<questionPage> {
  var counter = 0;
  String state = "Tiếp";

  List qText = [
    Question("Nước __ khắp sân 1", "Lênh Láng 1", "Nênh Náng 1", "a"),
    Question("Nước __ khắp sân 2", "Lênh Láng 2", "Nênh Náng 2", "a"),
    Question("Nước __ khắp sân 3", "Lênh Láng 3", "Nênh Náng 3", "a"),
    Question("Nước __ khắp sân 4", "Lênh Láng 4", "Nênh Náng 4", "a"),
    Question("Nước __ khắp sân 5", "Lênh Láng 5", "Nênh Náng 5", "a"),
  ];

  checkCorrect(String userChoice, BuildContext context) {
    if (userChoice == qText[counter].answerTrue) {
      print("correct");

      final snackbar = SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
        content: Text("Đúng!"),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    } else {
      print("false");

      final snackbar = SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
        content: Text("Sai!"),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    }

    setState(() {
      if (counter < 4) {
        counter = counter + 1;
      }

      if (counter == 4) {
        state = "Kết Thúc";
      }
    });
  }

  Widget choiceButton(String userChoice, String answer, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: MaterialButton(
        onPressed: () {
          checkCorrect(userChoice, context);
        },
        child: Text(
          answer,
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        color: Colors.white,
        minWidth: 200,
        height: 60,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Builder(
      builder: (BuildContext context) => Container(
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
          children: <Widget>[
            SizedBox(
              height: height(context) * 0.01,
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.white,
                  ),
                  Text(
                    "Luyện Tập",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: Center(
                  child: Text(
                    "Chọn Cách Phát Âm Đúng",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  qText[counter].question,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    choiceButton("a", qText[counter].answerA, context),
                    choiceButton("b", qText[counter].answerB, context),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: 10),
                child: MaterialButton(
                  onPressed: () {
                    if (counter < 4) {
                      counter++;
                    }
                    setState(() {
                      if (counter == 4) {
                        state = "Kết Thúc";
                      }
                    });
                  },
                  child: Text(
                    state,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  color: Colors.white,
                  minWidth: 70,
                  height: 30,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
