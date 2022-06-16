import 'package:bus_line_community/pages/home_page.dart';
import 'package:bus_line_community/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth auth = FirebaseAuth.instance;
  // Disable persistence on web platforms
  // await FirebaseAuth.instance.setPersistence(Persistence.LOCAL); 

  runApp(const Application());
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
    Widget build(BuildContext context){
      final user = FirebaseAuth.instance.currentUser;

      

      return MaterialApp(
        theme: ThemeData(useMaterial3: false),
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: (user != null ? HomePage() : LoginPage() 
        )
      )
    );
  }      
}