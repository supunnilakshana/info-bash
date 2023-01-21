import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infobash_view/constants/constraints.dart';

class RulesCard extends StatefulWidget {
  final List text;
  final String topic;
  const RulesCard({Key? key, required this.text, required this.topic})
      : super(key: key);

  @override
  State<RulesCard> createState() => _RulesCardState();
}

class _RulesCardState extends State<RulesCard> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ExpansionTile(
          title: Text(
            widget.topic,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),
          ),
          children: [
            BulletedList(listItems: widget.text,
            style: TextStyle(
              fontSize: 20,
              color: kPrimaryColordark,

            ),
              bullet: Icon(Icons.check_circle,size: 20,color: kPrimaryColordark,),

            )

          ],
          trailing: Icon(
            Icons.add,
            size: 35,
            color: kPrimaryColordark,
          ),
          collapsedTextColor: kPrimaryColordark,
          iconColor: kPrimaryColorlight,
          textColor: kPrimaryColorlight,
          expandedAlignment: Alignment.centerLeft,
          childrenPadding: EdgeInsets.only(left: 20),
          expandedCrossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
