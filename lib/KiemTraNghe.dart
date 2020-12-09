import 'package:flutter/material.dart';
import 'package:lisp_sync/constants.dart';
import 'package:lisp_sync/model/questionListen.dart';

class KiemTraNghe extends StatefulWidget {
  final nList = ["Nai", "Nông", "Năm", "Nào"];

  final lList = ["Lai", "Lông", "Lăm", "Lào"];

  @override
  _KiemTraNgheState createState() => _KiemTraNgheState();
}

class _KiemTraNgheState extends State<KiemTraNghe> {
  var counter = 0 ;
  String state = "Tiếp";

  List qList = [
    QuestionListen("Nai" , "Lai"),
    QuestionListen("Nông" , "Lông"),
    QuestionListen("Năm" , "Lăm"),
    QuestionListen("Nào" , "Lào"),

  ];

  checkCorrect(String userChoice, BuildContext context) {
    if (userChoice == "b") {
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
      if (counter < 3) {
        counter = counter + 1;
      }

      if (counter == 3) {
        state = "Kết Thúc";
      }
    });
  }

  Widget choiceButton(String userChoice, String answer, BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: MaterialButton(
        onPressed: () {checkCorrect(userChoice, context);},
        child: Text(
         answer,
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        color: Colors.white,
        minWidth: 70,
        height: 30,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)),
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
                  ])),
          child: Column(
            children: [
              SizedBox(
                height: height(context) * 0.02,
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
                      "Kiểm Tra Nghe",
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
                      "Nghe,chọn từ bạn nghe được",
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
                flex: 1,
                child: Container(
                  child: Center(
                    child: FlatButton(
                      shape: CircleBorder(
                        side: BorderSide(color: Color.fromRGBO(40, 20, 131, 0.8), width: 3),
                      ),
                      child: Icon(
                        Icons.play_circle_outline,
                        color: Color.fromRGBO(40, 20, 131, 1),
                      ),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      choiceButton("a", qList[counter].answerA, context),
                      SizedBox(
                        width:  width(context) * 0.2,
                      ),
                      choiceButton("b", qList[counter].answerB, context),
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
                      if (counter < 3) {
                        counter++;
                      }
                      setState(() {
                        if (counter == 3) {
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
      )
    );
  }
}
