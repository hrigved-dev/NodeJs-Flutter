import 'package:app/screens/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: IconButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(PageTransition(
              child: Dashboard(), type: PageTransitionType.leftToRight));
        },
        icon: Icon(Icons.arrow_forward_ios),
        color: Colors.black,
      ),
    );
  }
}
