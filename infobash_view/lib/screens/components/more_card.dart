import 'package:flutter/material.dart';
import 'package:infobash_view/constants/constraints.dart';

class MoreCard extends StatefulWidget {
  final String text;
  final Function function;
  const MoreCard({Key? key, required this.text, required this.function}) : super(key: key);

  @override
  State<MoreCard> createState() => _MoreCardState();
}

class _MoreCardState extends State<MoreCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
      color: kPrimaryColorlight,
      margin: EdgeInsets.only(left: 10, right: 10,top: 10),
      elevation: 4,
      child: ListTile(
        iconColor: Colors.white,
        trailing: Icon(Icons.arrow_forward_ios_sharp),
        contentPadding:
        EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
        onTap: () {
          widget.function();
        },
        title: Text(
          widget.text,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );;
  }
}
