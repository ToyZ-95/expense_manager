import 'package:expense_manager/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controllers/home_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.mulish().fontFamily,
        // fontFamily: GoogleFonts.workSans().fontFamily,
      ),
      home: MyHomePage(),
      //home: const HomeScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeController homeController = Get.put(HomeController());

  bool _initialized = false;

  @override
  initState() {
    super.initState();
    homeController.getAllBudgets().then((value) {
      homeController.budgetsModels.value = value;
      setState(() {
        _initialized = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return const HomeScreen();

    // if (_error) {
    //   return const Scaffold(
    //     body: Center(
    //       child: Text("Firebase Error"),
    //     ),
    //   );
    // }

    // if (FirebaseAuth.instance.currentUser != null) {
    //   return const HomeScreen();
    // }

    // return const Scaffold(
    //   body: Login(),
    // );
  }
}
