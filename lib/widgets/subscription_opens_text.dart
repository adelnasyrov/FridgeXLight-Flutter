import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubscriptionOpensText extends StatelessWidget {
  String whatOpened = "";

  SubscriptionOpensText({required this.whatOpened});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "•  ",
          style: TextStyle(
              fontFamily: "StolzlBook", color: Colors.white, fontSize: 17),
        ),
        Text(
          "Opens",
          style: TextStyle(
              fontFamily: "StolzlBook",
              color: Colors.deepOrangeAccent,
              fontSize: 17),
        ),
        Text(
          ' “',
          style: TextStyle(
              fontFamily: "StolzlBook", color: Colors.white, fontSize: 17),
        ),
        Text(
          whatOpened,
          style: TextStyle(
              fontFamily: "StolzlBook", color: Color(0xFFBCBCBC), fontSize: 17),
        ),
        Text(
          '” ',
          style: TextStyle(
              fontFamily: "StolzlBook", color: Colors.white, fontSize: 17),
        ),
        Text(
          'section',
          style: TextStyle(
              fontFamily: "StolzlBook", color: Colors.white, fontSize: 17),
        ),
      ],
    );
  }
}
