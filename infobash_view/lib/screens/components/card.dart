import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infobash_view/constants/constraints.dart';

class CardView extends StatelessWidget {
  CardView({
    Key? key,
    required this.function,
    required this.matchNumber,
    required this.team1,
    required this.team2,
    required this.team1Tot,
    required this.team1Wicket,
    required this.date,
    required this.team2Tot,
    required this.team2Wicket,
    this.winTeam,
    this.over1,
    this.ball2,
    this.ball1,
    this.over2,
    this.winToss,
  }) : super(key: key);

  final String matchNumber;
  final String team1;
  final String team2;
  final String team1Tot;
  final String team1Wicket;
  final String team2Tot;
  final String team2Wicket;
  final String date;
  String? winTeam;
  String? over1;
  String? ball1;
  String? over2;
  String? ball2;
  String? winToss;

  final Function function;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          left: size.width * 0.02,
          top: size.height * 0.02,
          right: size.width * 0.02),
      child: GestureDetector(
        onTap: () {
          function();
        },
        child: Center(
          child: Card(
            elevation: 8,
            color: Colors.white,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02, horizontal: size.width * 0.03),
              child: Container(
                //  height: size.height * 0.14,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "$matchNumber match",
                          style:
                              TextStyle(color: kPrimaryColordark, fontSize: 22),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            team1.capitalize.toString(),
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          over1 != null
                              ? Row(
                                  children: [
                                    Text(
                                      "${team1Tot} - ${team1Wicket}",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                    Container(
                                      width: 20,
                                    ),
                                    Text(
                                      "Overs( ${over1}.${ball1} )",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    )
                                  ],
                                )
                              : Container()
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            team2.capitalize.toString(),
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          over2 != null
                              ? Row(
                                  children: [
                                    Text(
                                      "${team2Tot} - ${team2Wicket}",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                    Container(
                                      width: 20,
                                    ),
                                    Text(
                                      "Overs( ${over2}.${ball2} )",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                  ],
                                )
                              : Container()
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Text("${winToss.toString().capitalize} won the toss"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }
}
