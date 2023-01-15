import 'package:flutter/material.dart';
import 'package:infobash_admin/services/base_service.dart';

import '../../constants/constraints.dart';
import '../components/buttons.dart';

class MatchCreationScreen extends StatefulWidget {
  const MatchCreationScreen({Key? key}) : super(key: key);

  @override
  State<MatchCreationScreen> createState() => _MatchCreationScreenState();
}

class _MatchCreationScreenState extends State<MatchCreationScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Request"),
        toolbarHeight: size.height * 0.09,
        backgroundColor: kPrimaryColordark,
        actions: [
          Image.asset("assets/icons/app_icon.png"),
        ],
      ),
      body: Container(
        child: Center(
          child: Genaralbutton(
            onpress: () async {},
            text: "Submit",
          ),
        ),
      ),
    );
  }
}
