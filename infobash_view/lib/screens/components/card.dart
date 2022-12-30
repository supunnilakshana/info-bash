import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  const CardView(
      {Key? key,
      required this.function,
      required this.matchNumber,
      required this.team1,
      required this.team2,
      required this.total,
      required this.wicket,
      required this.overs,
      required this.balls,
      required this.decision})
      : super(key: key);

  final String matchNumber;
  final String team1;
  final String team2;
  final String total;
  final String wicket;
  final String overs;
  final String balls;
  final String decision;

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
                height: size.height * 0.18,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "$matchNumber match",
                          style: TextStyle(color: Colors.black12, fontSize: 22),
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
                            "$total - $wicket ($overs.$balls)",
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
                            team2,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            "$decision opt to bat",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
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
