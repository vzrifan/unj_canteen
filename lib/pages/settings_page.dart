import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth/auth_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signOut() {
    // get auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Color(0xFF5B5B5B),
        foregroundColor: Color(0xFF16C8CF),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFF333333),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Icon(
              Icons.person,
              size: 80,
              color: Colors.deepPurple[100],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 9 - 20,
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.email,
                    color: Colors.deepPurple[100],
                    size: 20,
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Text(
                    "${_auth.currentUser!.email}",
                    style:
                        TextStyle(color: Colors.deepPurple[100], fontSize: 20),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 9 - 20,
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.fingerprint,
                    color: Colors.deepPurple[100],
                    size: 20,
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Text(
                    _auth.currentUser!.uid,
                    style:
                        TextStyle(color: Colors.deepPurple[100], fontSize: 20),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                minimumSize: Size.fromHeight(70),
              ),
              onPressed: signOut,
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
