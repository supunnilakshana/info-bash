import 'package:flutter/material.dart';

class PlayerCardBackground extends StatelessWidget {
  final String text;
  const PlayerCardBackground({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(),
          width: size.width,
          height: size.height * 0.05,
          child: Text(text),
        ),
        Divider(
          thickness: 1,
        )
      ],
    );
  }
}
