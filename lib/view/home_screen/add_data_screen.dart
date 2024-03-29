// ignore_for_file: prefer_const_constructors

import 'package:api_integration_practice2/controller/home_screen_controller.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: HomeScreenController.c1,
              decoration: InputDecoration(label: Text("Name")),
            ),
            TextFormField(
              controller: HomeScreenController.c2,
              decoration: InputDecoration(label: Text("Role")),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  addingData();

                  Navigator.pop(context);
                },
                child: Text("Add Data"))
          ],
        ),
      ),
    );
  }

  addingData() async {
    await Provider.of<HomeScreenController>(context, listen: false).addData();
    await Provider.of<HomeScreenController>(context, listen: false).fetchData();
  }
}
