import 'package:flutter/material.dart';

class ScoreRow extends StatefulWidget {
  final String batterName;
  final String runs;
  final String balls;
  final String fours;
  final String? sixes;
  const ScoreRow(
      {Key? key,
      required this.batterName,
      required this.runs,
      required this.balls,
      required this.fours,
      this.sixes})
      : super(key: key);

  @override
  State<ScoreRow> createState() => _ScoreRowState();
}

class _ScoreRowState extends State<ScoreRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              widget.batterName,
              style: TextStyle(fontSize: 20,color: Colors.blue),
            ),
          ),
          Row(
            textDirection: TextDirection.ltr,

            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(

                  widget.runs,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  widget.balls,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),

                child: Text(
                  widget.fours,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 10),
                child: widget.sixes!=null?Text(
                  widget.sixes.toString(),
                  style: TextStyle(fontSize: 20),
                ):Container()
              ),

            ],
          ),

        ],
      ),
    );
  }
}
