import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lisp_sync/constants.dart';

class HomePage extends StatelessWidget {
  final capam = ["L-N", "TR-CH", "D-R", "S-X"];
  final capvan = ["U-E", "U-O", "E-IE"];
  final thanhdieu = ["Dấu sắc", "Dấu huyền", "Dấu ngã", "Dấu hỏi", "Dấu nặng"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Color.fromRGBO(82, 95, 127, 1),
        ),
        title: Text(
          "Nội dung",
          style: TextStyle(
            color: Color.fromRGBO(82, 95, 127, 1),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: height(context),
          color: Colors.white60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 2),
                color: Colors.white,
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Text(
                      "Cặp âm",
                      style: TextStyle(
                          color: Color.fromRGBO(82, 95, 127, 1),
                          fontWeight: FontWeight.w600),
                    ),
                    width: width(context),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: height(context) * 0.2,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: capam
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "exercise_list");
                              },
                              child: Container(
                                height: height(context) * 0.2,
                                child: Column(
                                  children: [
                                    Flexible(
                                      flex: 6,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color.fromRGBO(40, 20, 131, 1),
                                              Color.fromRGBO(215, 130, 217, 1)
                                            ],
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 4,
                                      child: LayoutBuilder(
                                        builder: (context, constraint) =>
                                            Container(
                                          width: constraint.constrainWidth(),
                                          height: constraint.constrainHeight(),
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                220, 220, 220, 1),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(e),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                width: width(context) * 0.3,
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.red),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2),
                color: Colors.white,
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Text(
                      "Cặp vần",
                      style: TextStyle(
                          color: Color.fromRGBO(82, 95, 127, 1),
                          fontWeight: FontWeight.w600),
                    ),
                    width: width(context),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: height(context) * 0.2,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: capvan
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "exercise_list");
                              },
                              child: Container(
                                height: height(context) * 0.2,
                                child: Column(
                                  children: [
                                    Flexible(
                                      flex: 6,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color.fromRGBO(40, 20, 131, 1),
                                              Color.fromRGBO(215, 130, 217, 1)
                                            ],
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 4,
                                      child: LayoutBuilder(
                                        builder: (context, constraint) =>
                                            Container(
                                          width: constraint.constrainWidth(),
                                          height: constraint.constrainHeight(),
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                220, 220, 220, 1),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(e),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                width: width(context) * 0.3,
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.red),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2),
                color: Colors.white,
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Text(
                      "Thanh điệu",
                      style: TextStyle(
                          color: Color.fromRGBO(82, 95, 127, 1),
                          fontWeight: FontWeight.w600),
                    ),
                    width: width(context),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: height(context) * 0.2,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: thanhdieu
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "exercise_list");
                              },
                              child: Container(
                                height: height(context) * 0.2,
                                child: Column(
                                  children: [
                                    Flexible(
                                      flex: 6,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color.fromRGBO(40, 20, 131, 1),
                                              Color.fromRGBO(215, 130, 217, 1)
                                            ],
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 4,
                                      child: LayoutBuilder(
                                        builder: (context, constraint) =>
                                            Container(
                                          width: constraint.constrainWidth(),
                                          height: constraint.constrainHeight(),
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                220, 220, 220, 1),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(e),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                width: width(context) * 0.3,
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.red),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
