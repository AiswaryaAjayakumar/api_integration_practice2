// ignore_for_file: prefer_const_constructors

import 'package:api_integration_practice2/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    fetchingData();
    super.initState();
  }

  fetchingData() async {
    await Provider.of<HomeScreenController>(context, listen: false).fetchData();
  }

  deletingData(int id) async {
    await Provider.of<HomeScreenController>(context, listen: false)
        .deleteData(id);
    await fetchingData();
  }

  @override
  Widget build(BuildContext context) {
    final homeScreenState = Provider.of<HomeScreenController>(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: homeScreenState.apiRes?.data?.length,
        itemBuilder: (context, index) => Center(
            child: Column(
          children: [
            Text(homeScreenState.apiRes?.data?[index].name ?? ""),
            IconButton(
                onPressed: () {
                  deletingData(homeScreenState.apiRes?.data?[index].id ?? -1);
                  setState(() {});
                },
                icon: Icon(Icons.delete))
          ],
        )),
      ),
    );
  }
}
