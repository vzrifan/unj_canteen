import 'package:unj_canteen/helper/indicator_status.dart';
import 'package:unj_canteen/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helper/custom_widget.dart';
import 'blok_m_1.dart';
import 'blok_m_2.dart';
import 'blok_m_3.dart';

class BlokM4 extends StatefulWidget {
  const BlokM4({super.key});

  @override
  State<BlokM4> createState() => _BlokM4State();
}

class _BlokM4State extends State<BlokM4> {
  final TextEditingController _searchController = TextEditingController();
  final List<List<String>> _dataList = [
    ["Mie Ayam", "Bakso", "Mie Ayam Bakso"],
    ["Kebab", "Kebab Hitam", "Burger"],
    ["Katsu", "Dimsum", "Ayam"],
    ["Nasi Goreng", "Mie Goreng", "Nagomi"]
  ];
  final List<String> _filteredDataList = [];
  // instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    // Initialize the filtered list with the full list of data.
    _filteredDataList.addAll(_dataList.expand((list) => list).toList());
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
                                hintStyle: const TextStyle(color: Color(0xFF15C8CF)),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildElevatedButton("1", getStatus(), context, const BlokM1()),
                buildElevatedButton("2", getStatus(), context, const BlokM2()),
                buildElevatedButton("3", getStatus(), context, const BlokM3()),
                buildElevatedButton("4", getStatus(), context, const BlokM4()),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            buildTextTitle("Hello Kitty"),
            const SizedBox(
              height: 20,
            ),
            buildContainerCard(0),
            const SizedBox(
              height: 10,
            ),
            buildTextTitle("Kebab Daksin"),
            const SizedBox(
              height: 20,
            ),
            buildContainerCard(1),
            const SizedBox(
              height: 10,
            ),
            buildTextTitle("Katsu Gacor"),
            const SizedBox(
              height: 20,
            ),
            buildContainerCard(2),
            const SizedBox(
              height: 10,
            ),
            buildTextTitle("Nasi Goreng Smeng"),
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

  // // build a list of users except for the current logged in user
  // Widget _buildUserList() {
  //   return StreamBuilder<QuerySnapshot>(
  //     stream: FirebaseFirestore.instance.collection('users').snapshots(),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasError) {
  //         return const Text("error");
  //       }

  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return const Text("Loading..");
  //       }

  //       return ListView(
  //         children: snapshot.data!.docs
  //             .map<Widget>((doc) => _buildUserListItem(doc))
  //             .toList(),
  //       );
  //     },
  //   );
  // }

  // // build individual user list items
  // Widget _buildUserListItem(DocumentSnapshot document) {
  //   Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

  //   // display all users except current user
  //   if (_auth.currentUser!.email != data['email']) {
  //     return ListTile(
  //       title: Text(data["email"]),
  //       onTap: () {
  //         // pass the clicked user's UID to the chat page
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => ChatPage(
  //               receiverUserEmail: data["email"],
  //               receiveUserId: data["uid"],
  //             )));
  //       },
  //     );
  //   }else{
  //     return Container();
  //   }
  // }
}
