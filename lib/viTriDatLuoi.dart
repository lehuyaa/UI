import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class viTriDatLuoi extends StatefulWidget {
  @override
  _viTriDatLuoiState createState() => _viTriDatLuoiState();
}

class _viTriDatLuoiState extends State<viTriDatLuoi> {
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
                      "Vị Trí Đặt Lưỡi",
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
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "L - N",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  overflow: TextOverflow.clip,
                ),
              ),
              Expanded(
                  flex: 8,
                  child: Container(
                    margin: EdgeInsets.only(left: 30.0 , right: 30.0),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(left: 40.0, right: 40.0),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image:
                                  AssetImage('assets/ViTriDatLuoi.png'),
                            )),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "[N]",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(left: 40.0, right: 40.0),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image:
                                  AssetImage('assets/ViTriDatLuoi.png'),
                            )),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "[L]",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: height(context) * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
