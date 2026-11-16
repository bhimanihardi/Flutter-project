// import 'package:flutter/material.dart';
// import 'package:project_129/dashboard.dart';
// import 'package:project_129/form.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home:Dashboard()/*navigator_push(),
//
//        //for lab 10 Navigator.pushName
//        initialRoute: "/",
//        routes: {
//          "/temp1": (context)=>image(),
//          "/temp2":(context)=>image_network(),
//        }
//        ,*/
//     );
//   }
// }
//
//




// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:untitled/Registration_form.dart';
// import 'package:untitled/dashboard.dart';
//
// void main(){
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: dashboard(),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: DashboardScreen(), // ✅ Start with dashboard
      debugShowCheckedModeBanner: false,
    );
  }
}


