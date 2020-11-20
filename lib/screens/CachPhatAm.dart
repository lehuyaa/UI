import 'package:flutter/material.dart';
import 'package:lisp_sync/constants.dart';

class cachPhatAm extends StatefulWidget {
  @override
  _cachPhatAmState createState() => _cachPhatAmState();
}

class _cachPhatAmState extends State<cachPhatAm> {
  var counter = 0;

  List text = [
    "Vị Trí Đặt Lưỡi",
    "Khẩu Hình",
  ];

  List image = [
    "ViTriDatLuoi.png",
    "KhauHinh.png",
  ];

  List link = [
    "viTriDatLuoi",
    "viTriDatLuoi",
  ];

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
                      "Cách Phát Âm",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FlatButton(
                      shape: CircleBorder(
                        side: BorderSide(
                            color: Color.fromRGBO(40, 20, 131, 0.8), width: 3),
                      ),
                      child: Icon(
                        Icons.play_circle_outline,
                        color: Color.fromRGBO(40, 20, 131, 1),
                      ),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          if (counter > 0) {
                            counter = counter - 1;
                          }
                        });
                      },
                    ),
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('assets/' + image[counter]),
                    ),
                    FlatButton(
                      shape: CircleBorder(
                        side: BorderSide(
                            color: Color.fromRGBO(40, 20, 131, 0.8), width: 3),
                      ),
                      child: Icon(
                        Icons.play_circle_outline,
                        color: Color.fromRGBO(40, 20, 131, 1),
                      ),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          if (counter < 1) {
                            counter = counter + 1;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.only(
                      left: 40.0, right: 40.0, top: 20.0, bottom: 20.0),
                  child: Center(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, link[counter]);
                      },
                      child: Text(
                        text[counter],
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height(context) * 0.1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
