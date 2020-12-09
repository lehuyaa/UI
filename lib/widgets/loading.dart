import 'package:flutter/material.dart';
import 'package:lisp_sync/util/variable.dart';

class Loading extends StatefulWidget {
  Loading({this.backgroundColor});

  final Color backgroundColor;

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    gifLoading.evict();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromRGBO(40, 20, 131, 1),
                Color.fromRGBO(215, 130, 217, 1)
              ])),
          child: Center(
            child: Column(children: [
              SizedBox(height: 80),
              Image(image: gifLoading),
              SizedBox(height: 15),
              Text('Dữ liệu đang được tải đừng nóng ...',
                  style: TextStyle(fontFamily: 'monospace', fontSize: 16))
            ]),
          ),
        ));
  }
}
