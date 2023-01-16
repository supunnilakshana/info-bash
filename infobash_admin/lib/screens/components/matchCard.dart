import 'package:flutter/material.dart';

class MatchCard extends StatefulWidget {
  final String? team1;
  final String team2;
  const MatchCard({Key? key, this.team1, required this.team2}) : super(key: key);

  @override
  State<MatchCard> createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.18,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "4 match",
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
                    Text(
                      "Team",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      "${widget.team2}",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40,top: 10),
                child: Row(
                  children: [
                    Text(
                      "9.00 a.m",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 2,
        )
      ],
    ) ;
  }
}
