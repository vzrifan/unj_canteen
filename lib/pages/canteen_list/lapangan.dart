import 'dart:async';

import 'package:unj_canteen/pages/canteen_list/daksin_barat.dart';
import 'package:unj_canteen/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helper/custom_widget.dart';
import '../../helper/utils.dart';

class Lapangan extends StatefulWidget {
  const Lapangan({super.key});

  @override
  State<Lapangan> createState() => _LapanganState();
}

class _LapanganState extends State<Lapangan> {
  final TextEditingController _searchController = TextEditingController();
  final List<List<String>> _dataList = [
    ["Nasi Goreng", "Mie Goreng", "Nagomi"],
    ["Katsu", "Dimsum", "Ayam"],
    ["Mie Ayam", "Bakso", "Mie Ayam Bakso"],
    ["Kebab", "Kebab Hitam", "Burger"],
  ];
  final List<String> _filteredDataList = [];
  List<Progress> prog = Progress.getProg();
  late Timer _timer;

  // instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    // Initialize the filtered list with the full list of data.
    _filteredDataList.addAll(_dataList.expand((list) => list).toList());
    _startTimer();
  }

  void _startTimer() {
    // Update the percentages every 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        // Update your progress data here
        prog = Progress.getProg();
      });
    });
  }

  @override
  void dispose() {
    // Dispose of the timer to prevent memory leaks
    _timer.cancel();
    super.dispose();
  }

  void _filterList(String searchQuery) {
    _filteredDataList.clear();

    if (searchQuery.isEmpty) {
      // If the search query is empty, show the full list.
      _filteredDataList.addAll(_dataList.expand((list) => list));
    } else {
      // Filter the list based on the search query.
      _filteredDataList.addAll(_dataList.expand((list) => list.where(
          (foodName) =>
              foodName.toLowerCase().contains(searchQuery.toLowerCase()))));
    }

    setState(() {});
  }

  // sign user out
  void signOut() {
    // get auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(35),
        child: AppBar(
          backgroundColor: const Color(0xFF5B5B5B),
          elevation: 0,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFF333333),
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const ShapeDecoration(
                  color: Color(0xFF5B5B5B),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Selamat Datang di Kantin UNJ\n${_auth.currentUser!.email}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          height: 0,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Image(
                        image: AssetImage("assets/images/logo_unj.png"),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: TextField(
                            controller: _searchController,
                            style: const TextStyle(color: Colors.white),
                            onChanged: (value) {
                              _filterList(value);
                            },
                            decoration: InputDecoration(
                                fillColor: const Color(0xFF333333),
                                filled: true,
                                suffixIcon: const Icon(
                                  Icons.search,
                                  color: Color(0xFF15C8CF),
                                ),
                                hintText: "   Search",
                                hintStyle:
                                    const TextStyle(color: Color(0xFF15C8CF)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                buildDaksinIndicator(prog),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildElevatedButton("Daksin Barat", prog[0].progressColor,
                        context, const DaksinBarat()),
                    buildElevatedButton("Lapangan", prog[1].progressColor,
                        context, const Lapangan()),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            buildTextTitle("Nasi Goreng Smeng"),
            const SizedBox(
              height: 20,
            ),
            buildContainerCard(0),
            const SizedBox(
              height: 10,
            ),
            buildTextTitle("Katsu Gacor"),
            const SizedBox(
              height: 20,
            ),
            buildContainerCard(1),
            const SizedBox(
              height: 10,
            ),
            buildTextTitle("Hello Kitty"),
            const SizedBox(
              height: 20,
            ),
            buildContainerCard(2),
            const SizedBox(
              height: 10,
            ),
            buildTextTitle("Kebab Daksin"),
            const SizedBox(
              height: 20,
            ),
            buildContainerCard(3),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainerCard(int index) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 168,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: _filteredDataList
              .where((foodName) =>
                  _dataList.isNotEmpty && _dataList[index].contains(foodName))
              .map((foodName) => buildCard("$foodName.png", foodName, context))
              .toList()),
    );
  }
}
