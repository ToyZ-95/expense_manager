import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/constants/constants.dart';
import 'package:expense_manager/widgets/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    //Home Widget
    Home(),
    //Stats Widget
    Text(
      'Index 1: Business',
    ),
    //Settings
    Text(
      'Index 2: School',
    ),
    //Expense
    Text(
      'Index 4: School',
    ),
  ];

  Future<void> addUser() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    if (FirebaseAuth.instance.currentUser != null) {
      // Call the user's CollectionReference to add a new user
      var creds = FirebaseAuth.instance.currentUser;

      users
          .where('Email', isEqualTo: creds!.email)
          .get()
          .then((QuerySnapshot querySnapshot) => {
                querySnapshot.docs.forEach((doc) {
                  print(doc["Email"]);
                })
              });

      // var data = users
      //     .doc(creds!.email)
      //     .get()
      //     .then((DocumentSnapshot documentSnapshot) {
      //   if (documentSnapshot.exists) {
      //     print('Document exists on the database');
      //   }
      // });
    }
  }

  @override
  void initState() {
    // Create a CollectionReference called users that references the firestore collection
    addUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kSecondaryColor,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_max_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Expense',
          ),
        ],
      ),
    );
  }
}
