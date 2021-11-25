import 'package:fluent_todo/screens/homepage.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoSansTextTheme(),
        backgroundColor: Color.fromARGB(255, 250, 250, 250),
      ),
      home: HomePage(),
    );
  }
}

// myApp() {
//   return MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text("Fluent Todo (Alpha)"),
//         ),
//       ),
//       body: Center(
//         child: Container(
//           margin: EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
//           height: 100,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(10),
//               topRight: Radius.circular(10),
//               bottomLeft: Radius.circular(10),
//               bottomRight: Radius.circular(10),
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 5,
//                 blurRadius: 7,
//                 offset: Offset(0, 3), // changes position of shadow
//               ),
//             ],
//           ),
//         ),
//       ),
//       // bottomNavigationBar: BottomNavigationBar(
//       //   items: const <BottomNavigationBarItem>[
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.settings),
//       //       //label: 'Settings',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.list),
//       //       //label: 'Favourites',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.notifications),
//       //       //label: 'Alerts',
//       //     ),
//       //   ],
//       //   selectedItemColor: Colors.blue,
//       // ),
//     ),
//   );
// }
