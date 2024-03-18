// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:api_integration_practice2/controller/home_screen_controller.dart';
import 'package:api_integration_practice2/view/home_screen/add_data_screen.dart';
import 'package:flutter/material.dart';

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

  addingData() async {
    await Provider.of<HomeScreenController>(context, listen: false).addData();
    await fetchingData();
  }

  @override
  Widget build(BuildContext context) {
    final homeScreenState = Provider.of<HomeScreenController>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 500,
            child: ListView.builder(
              padding: EdgeInsets.all(20),
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: homeScreenState.apiRes?.data?.length,
              itemBuilder: (context, index) => Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(homeScreenState.apiRes?.data?[index].name ?? ""),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            deletingData(
                                homeScreenState.apiRes?.data?[index].id ?? -1);
                            setState(() {});
                          },
                          icon: Icon(Icons.delete)),
                    ],
                  ),
                ],
              )),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddDataScreen(),
                    ));
                // await fetchingData();
              },
              child: Text("Add Data"))
        ],
      ),
    );
  }
}
