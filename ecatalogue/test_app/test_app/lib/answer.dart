import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20,right: 20,top: 20),
      child: ElevatedButton(
        style:ElevatedButton.styleFrom(
                          elevation: 0,                       
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(30),
                          )),
         child: Text(answerText),
        onPressed:selectHandler,
      ),
    );
  }
}
