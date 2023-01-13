import 'package:flutter/material.dart';

class PendingScreen extends StatefulWidget {
  final String? id;
  const PendingScreen({Key? key, this.id}) : super(key: key);

  @override
  State<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Your request is under reviewing.......')),
    );
  }
}
