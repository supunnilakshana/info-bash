import 'package:flutter/material.dart';
import 'package:infobash_admin/constants/constraints.dart';


class PlayerCard extends StatelessWidget {
  final String name;
  const PlayerCard({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [

            Container(
              width: size.width,

              child: ListTile(
                leading: Icon(Icons.face_outlined),
                title: Text(
                  name,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
        Divider(
          thickness: 1,
          color: kPrimaryColorlight,
        )
      ],
    );
  }
}
