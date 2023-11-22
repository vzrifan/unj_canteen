import 'package:unj_canteen/services/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign user out
  void signOut() {
    // get auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          actions: [
            // sign out button
            IconButton(onPressed: signOut, icon: Icon(Icons.logout))
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          color: Color(0xFF282828),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hi and Welcome\n${_auth.currentUser!.email}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                      height: 0,
                    ),
                  ),
                  Container(
                    width: 68,
                    height: 68,
                    decoration: ShapeDecoration(
                      color: Color(0xFF3300FF),
                      shape: OvalBorder(),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: Color(0xFF333333),
                    filled: true,
                    suffixIcon: Icon(
                      Icons.search,
                      color: Color(0xFF15C8CF),
                    ),
                    hintText: "    Search",
                    hintStyle: TextStyle(color: Color(0xFF15C8CF)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      InkWell(
                        // TODO navigate food
                        onTap: () {},
                        child: Image(
                          image: AssetImage("assets/images/food.png"),
                          width: 56,
                          height: 56,
                        ),
                      ),
                      Text(
                        'Food',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        //TODO navigate to drink
                        onTap: () {},
                        child: Image(
                          image: AssetImage("assets/images/drink.png"),
                          width: 56,
                          height: 56,
                        ),
                      ),
                      Text(
                        'Drink',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        // TODO navigate to ice cream
                        onTap: () {},
                        child: Image(
                          image: AssetImage("assets/images/ice_cream.png"),
                          width: 56,
                          height: 56,
                        ),
                      ),
                      Text(
                        'Ice Cream',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '  Lantai 1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 168,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Card(
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      color: Color(0xFF333333),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 206,
                            height: 168,
                            color: Color(0xFF333333),
                            child: Column(
                              children: [
                                InkWell(
                                  //TODO navigate
                                  onTap: () {},
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/burger.png"),
                                    width: 206,
                                    height: 116,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: ' Burger tikus\n',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' (nama resto)',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                        // TODO navigate
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                            backgroundColor:
                                                Color(0xFF15C8CF),
                                            foregroundColor: Colors.white,
                                            side: BorderSide(
                                                color: Color(0xFF333333),
                                                width: 2.0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0))),
                                        child: Text(
                                          'Pesan',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w800,
                                            height: 0,
                                          ),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      color: Color(0xFF333333),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 206,
                            height: 168,
                            color: Color(0xFF333333),
                            child: Column(
                              children: [
                                InkWell(
                                  //TODO navigate
                                  onTap: () {},
                                  child: Image(
                                    image:
                                        AssetImage("assets/images/pizza.png"),
                                    width: 206,
                                    height: 116,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: ' Burger tikus\n',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' (nama resto)',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                        // TODO navigate
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                            backgroundColor:
                                                Color(0xFF15C8CF),
                                            foregroundColor: Colors.white,
                                            side: BorderSide(
                                                color: Color(0xFF333333),
                                                width: 2.0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0))),
                                        child: Text(
                                          'Pesan',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w800,
                                            height: 0,
                                          ),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '  Lantai 2',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 168,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Card(
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      color: Color(0xFF333333),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 206,
                            height: 168,
                            color: Color(0xFF333333),
                            child: Column(
                              children: [
                                InkWell(
                                  //TODO navigate
                                  onTap: () {},
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/burger.png"),
                                    width: 206,
                                    height: 116,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: ' Burger tikus\n',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' (nama resto)',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                        // TODO navigate
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                            backgroundColor:
                                                Color(0xFF15C8CF),
                                            foregroundColor: Colors.white,
                                            side: BorderSide(
                                                color: Color(0xFF333333),
                                                width: 2.0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0))),
                                        child: Text(
                                          'Pesan',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w800,
                                            height: 0,
                                          ),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      color: Color(0xFF333333),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 206,
                            height: 168,
                            color: Color(0xFF333333),
                            child: Column(
                              children: [
                                InkWell(
                                  //TODO navigate
                                  onTap: () {},
                                  child: Image(
                                    image:
                                        AssetImage("assets/images/pizza.png"),
                                    width: 206,
                                    height: 116,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: ' Burger tikus\n',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' (nama resto)',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                        // TODO navigate
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                            backgroundColor:
                                                Color(0xFF15C8CF),
                                            foregroundColor: Colors.white,
                                            side: BorderSide(
                                                color: Color(0xFF333333),
                                                width: 2.0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0))),
                                        child: Text(
                                          'Pesan',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w800,
                                            height: 0,
                                          ),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '  Lantai 3',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 168,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Card(
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      color: Color(0xFF333333),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 206,
                            height: 168,
                            color: Color(0xFF333333),
                            child: Column(
                              children: [
                                InkWell(
                                  //TODO navigate
                                  onTap: () {},
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/burger.png"),
                                    width: 206,
                                    height: 116,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: ' Burger tikus\n',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' (nama resto)',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                        // TODO navigate
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                            backgroundColor:
                                                Color(0xFF15C8CF),
                                            foregroundColor: Colors.white,
                                            side: BorderSide(
                                                color: Color(0xFF333333),
                                                width: 2.0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0))),
                                        child: Text(
                                          'Pesan',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w800,
                                            height: 0,
                                          ),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      color: Color(0xFF333333),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 206,
                            height: 168,
                            color: Color(0xFF333333),
                            child: Column(
                              children: [
                                InkWell(
                                  //TODO navigate
                                  onTap: () {},
                                  child: Image(
                                    image:
                                        AssetImage("assets/images/pizza.png"),
                                    width: 206,
                                    height: 116,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: ' Burger tikus\n',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' (nama resto)',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                        // TODO navigate
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                            backgroundColor:
                                                Color(0xFF15C8CF),
                                            foregroundColor: Colors.white,
                                            side: BorderSide(
                                                color: Color(0xFF333333),
                                                width: 2.0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0))),
                                        child: Text(
                                          'Pesan',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w800,
                                            height: 0,
                                          ),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '  Lantai 4',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 168,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Card(
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      color: Color(0xFF333333),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 206,
                            height: 168,
                            color: Color(0xFF333333),
                            child: Column(
                              children: [
                                InkWell(
                                  //TODO navigate
                                  onTap: () {},
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/burger.png"),
                                    width: 206,
                                    height: 116,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: ' Burger tikus\n',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' (nama resto)',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                        // TODO navigate
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                            backgroundColor:
                                                Color(0xFF15C8CF),
                                            foregroundColor: Colors.white,
                                            side: BorderSide(
                                                color: Color(0xFF333333),
                                                width: 2.0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0))),
                                        child: Text(
                                          'Pesan',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w800,
                                            height: 0,
                                          ),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      color: Color(0xFF333333),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 206,
                            height: 168,
                            color: Color(0xFF333333),
                            child: Column(
                              children: [
                                InkWell(
                                  //TODO navigate
                                  onTap: () {},
                                  child: Image(
                                    image:
                                        AssetImage("assets/images/pizza.png"),
                                    width: 206,
                                    height: 116,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: ' Burger tikus\n',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' (nama resto)',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                        // TODO navigate
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                            backgroundColor:
                                                Color(0xFF15C8CF),
                                            foregroundColor: Colors.white,
                                            side: BorderSide(
                                                color: Color(0xFF333333),
                                                width: 2.0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0))),
                                        child: Text(
                                          'Pesan',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w800,
                                            height: 0,
                                          ),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
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
