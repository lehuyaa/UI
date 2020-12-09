import 'package:flutter/material.dart';
import 'package:lisp_sync/constants.dart';

class KiemTraPhatAm extends StatefulWidget {
  @override
  _KiemTraPhatAmState createState() => _KiemTraPhatAmState();
}

class _KiemTraPhatAmState extends State<KiemTraPhatAm> {
  var counter = 0;

  String state = "Tiếp";

  List qList = ["Nai", "Nông", "Năm", "Nào", "Lai", "Lông", "Lăm", "Lào"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Container(
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
                      "Kiểm Tra Phát Âm",
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
                      "Ghi Lại Phát Âm Của Bạn",
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
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      qList[counter],
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    color: Colors.white,
                    minWidth: 70,
                    height: 30,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: FlatButton(
                    shape: CircleBorder(
                      side: BorderSide(
                          color: Color.fromRGBO(40, 20, 131, 0.8), width: 3),
                    ),
                    child: Icon(
                      Icons.add_circle,
                      color: Colors.red,
                      size: 15,
                    ),
                    color: Colors.white,
                    onPressed: () {},
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
                      if (counter < 7) {
                        counter++;
                      }
                      setState(() {
                        if (counter == 7) {
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
      ),
    );
  }
}
