import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:lisp_sync/constants.dart';
import 'package:lisp_sync/resources/strings.dart';
import 'package:lisp_sync/screens/test/data.dart';
import 'package:lisp_sync/widgets/play_audio.dart';
import 'package:provider/provider.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:lisp_sync/screens/questions/choice/controller.dart';
import 'package:lisp_sync/screens/questions/choice/data.dart';

class Choice extends StatelessWidget {
  static withDependency(Map<String, dynamic> data) {
    return StateNotifierProvider<ChoiceController, ChoiceData>(
        create: (_) => ChoiceController(data), child: Choice());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context),
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
            height: height(context) * 0.1,
          ),
          _buildLabel(
              context, Provider.of<ChoiceData>(context, listen: false).label),
          SizedBox(
            height: height(context) * 0.1,
          ),
          _buildAnswer(
              context, Provider.of<ChoiceData>(context, listen: false).answers)
        ],
      ),
    );
  }

  Widget _buildSuggest(BuildContext context, AnswerChoice suggest) {
    if (suggest == null) return Container();
    if (suggest.type == 'audio') return PlayAudio(url: suggest.data);
    if (suggest.type == 'image')
      return Container(
          margin: EdgeInsets.only(top: 50),
          width: 200,
          height: 200,
          child: TransitionToImage(
              enableRefresh: true,
              loadingWidget: Image.asset(urlIconLoadingImage),
              placeholder: Icon(Icons.refresh),
              image: AdvancedNetworkImage(suggest.data, useDiskCache: true,
                  loadedCallback: () {
                Provider.of<ChoiceController>(context, listen: false)
                    .updateTime(DateTime.now());
              }),
              fit: BoxFit.fill));
    return Container();
  }

  Widget _buildLabel(BuildContext context, String label) {
    if (label == null || label == '') return Container(height: 40);
    return Container(
      height: height(context) * 0.15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10)),
      ),
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildAnswer(BuildContext context, List<AnswerChoice> answers) {
    print(answers[0].data);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          for (int i = 0; i < answers.length; i += 2)
            Row(children: [
              _CellRow(answer: answers[i]),
              Spacer(),
              _CellRow(answer: answers[i + 1])
            ]),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class _CellRow extends StatefulWidget {
  _CellRow({this.answer, this.choice = false});

  AnswerChoice answer;
  bool choice;

  @override
  __CellRowState createState() => __CellRowState();
}

class __CellRowState extends State<_CellRow> {
  AnswerChoice get answer => widget.answer;

  get choice => widget.choice;

  set choice(bool choice) => widget.choice = choice;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bool add = context.read<ChoiceController>().addAnswer(answer);
        if (add)
          setState(() {
            choice = !choice;
          });
      },
      child: answer.type == 'audio'
          ? Container(
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle),
              width: (MediaQuery.of(context).size.width - 38) / 2,
              height: answer.type == 'image'
                  ? (MediaQuery.of(context).size.width - 38) / 2
                  : 40,
              child: PlayAudio(
                url: answer.data,
              ),
            )
          : Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              width: (MediaQuery.of(context).size.width - 38) / 2,
              height: answer.type == 'image'
                  ? (MediaQuery.of(context).size.width - 38) / 2
                  : 40,
              child: Container(
                  decoration: BoxDecoration(
                      color: answer.type == 'image'
                          ? Colors.transparent
                          : Colors.blue.withAlpha(30),
                      border: choice
                          ? Border.all(color: Colors.blue)
                          : Border.all(color: Colors.white)),
                  child: answer.type == 'image'
                      ? TransitionToImage(
                          enableRefresh: true,
                          loadingWidget: Image.asset(urlIconLoadingImage),
                          placeholder: Icon(Icons.refresh),
                          image: AdvancedNetworkImage(answer.data,
                              useDiskCache: true, loadedCallback: () {
                            Provider.of<ChoiceController>(context,
                                    listen: false)
                                .updateTime(DateTime.now());
                          }),
                          fit: BoxFit.fill)
                      : Container(
                          padding: EdgeInsets.all(10),
                          child: Text(answer.data,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'monospace')),
                        ))),
    );
  }
}
