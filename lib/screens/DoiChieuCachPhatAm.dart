import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lisp_sync/constants.dart';

class DoiChieuCachPhatAm extends StatefulWidget {
  final nList = ["Nai", "Nông", "Năm", "Nào"];

  final lList = ["Lai", "Lông", "Lăm", "Lào"];

  @override
  _DoiChieuCachPhatAmState createState() => _DoiChieuCachPhatAmState();
}

class _DoiChieuCachPhatAmState extends State<DoiChieuCachPhatAm> {
  Widget _buildListItem(BuildContext context, String wordsN, String wordsL) {
    return Row(
      children: [
        SizedBox(
          width:  width(context) * 0.1,
        ),
        FlatButton(
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

       Container(
         width: width(context) * 0.1,
         child:  Text(
           wordsN,
           style: TextStyle(
             color: Colors.white,
             fontWeight: FontWeight.w600,
           ),
         ),
       ),
        SizedBox(
          width:  width(context) * 0.15,
        ),
        FlatButton(
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

        Container(
          width: width(context) * 0.1,
          child: Text(
            wordsL,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

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
                      "Đối Chiếu Cách Phát Âm",
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
                      "Nghe,so sánh cách phát âm đúng",
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: width(context) * 0.2,
                          bottom: 20,
                          right: width(context) * 0.2,
                        ),
                        child: Text(
                          "[N]",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: width(context) * 0.2,
                          bottom: 20,
                          right: width(context) * 0.2,
                        ),
                        child: Text(
                          "[L]",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => _buildListItem(
                        context, widget.nList[index], widget.lList[index]),
                    itemCount: widget.nList.length,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(bottom: 10),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      "Kết Thúc",
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
