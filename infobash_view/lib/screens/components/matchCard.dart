import 'package:flutter/material.dart';

class MatchCard extends StatefulWidget {
  final int? id;
  final String? team1;
  final String team2;
  final String? status;

  const MatchCard({Key? key, this.team1, required this.team2, this.id, this.status}) : super(key: key);

  @override
  State<MatchCard> createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(

      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "${widget.id} match",
                    style: TextStyle(color: Colors.black12, fontSize: 22),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.team1}",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.team2}",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Text(
                    "${widget.status}",
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(
          thickness: 2,
        )
      ],
    ) ;
  }
}
