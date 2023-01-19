import 'package:flutter/material.dart';
import 'package:infobash_admin/screens/components/drawer.dart';
import 'package:infobash_admin/services/base_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await BaseService().makeround1match(bpo: 4, over: 5);
        },
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
