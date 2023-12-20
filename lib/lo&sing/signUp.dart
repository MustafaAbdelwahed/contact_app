// // ignore_for_file: prefer_const_constructors

// import 'package:contact_app/login.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SignUpScreen extends StatelessWidget {
//   SignUpScreen({super.key});
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     ///////////////////

//     return Scaffold(
//       // appBar: AppBar(),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         child: ListView(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Text(
//                   "Sign up",
//                   style: TextStyle(fontSize: 30),
//                 ),
//                 SizedBox(
//                   height: 40,
//                 ),
//                 TextField(
//                   controller: _usernameController,
//                   decoration: InputDecoration(
//                     label: Text(
//                       "Username",
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 40,
//                 ),
//                 TextField(
//                   obscureText: true,
//                   autofocus: true,
//                   controller: _passwordController,
//                   decoration: InputDecoration(
//                     label: Text(
//                       "Password",
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 60,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     signup(context);
//                   },
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
//                   child: Text(
//                     "save users",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 70),
//                   child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => LoginScreen()));
//                       },
//                       child: Text("login ?")),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void signup(context) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
//       print("the usernaem or password is empty  ");
//     } else {
//       pref.setString(_usernameController.text, _passwordController.text);
//       Navigator.of(context)
//           .push(MaterialPageRoute(builder: (context) => LoginScreen()));
//     }
//   }
// }
