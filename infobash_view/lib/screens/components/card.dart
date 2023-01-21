import 'package:flutter/material.dart';
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
    this.winTeam
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
                height: size.height * 0.14,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date : ${date}",
                      style: TextStyle(color: kPrimaryColordark, fontSize: 22),
                    ),
                    Row(
                      children: [
                        Text(
                          "$matchNumber match",
                          style: TextStyle(color: kPrimaryColordark, fontSize: 22),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            team1,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          Text(
                            "${team1Tot} - ${team1Wicket}",
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
                            team2,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          Text(
                            "${team2Tot} - ${team2Wicket}",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [

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
    ;
  }
}
