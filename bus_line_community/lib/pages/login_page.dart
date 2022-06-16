import 'package:bus_line_community/pages/home_page.dart';
import 'package:bus_line_community/pages/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "", password = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text("Rede Social dos Busao",
                style: TextStyle(
                  color: const Color(0xFF000000),
                  fontWeight: FontWeight.w400,
                  fontSize: 28.0,
                  fontStyle: FontStyle.normal,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.left,
                textDirection: TextDirection.ltr,
                maxLines: 1),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    email = text;
                  });
                },
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: Color.fromARGB(255, 34, 196, 169)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: Color.fromARGB(255, 34, 196, 169), width: 2.0),
                  ),
                  hintText: 'Endereço de Email',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    password = text;
                  });
                },
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: Color.fromARGB(255, 34, 196, 169)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: Color.fromARGB(255, 34, 196, 169), width: 2.0),
                  ),
                  hintText: 'Senha',
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (email != "" && password != "") {
                await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
                  .then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage())));
              } else {

              }
            }, 
            child: const Padding(padding: EdgeInsets.all(16.0), child: Text("Fazer Login")),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32)
              )
            ),
          ),
          TextButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupPage()));
          }, child: const Text("Criar uma conta")),
        ],
      ),
    );
  }
}