//  import 'package:flutter/material.dart';
//  import 'form_screen.dart';
//
// class DashboardScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dashboard'),
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.deepPurple, Colors.purpleAccent],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//         elevation: 8,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.deepPurple.shade100, Colors.white],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           children: [
//             SizedBox(height: 20),
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: GridView.count(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 20,
//                   mainAxisSpacing: 20,
//                   children: [
//                     ControlCard(
//                       title: 'Add User',
//                       icon: Icons.edit_note,
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => FormScreen()),
//                         );
//                       },
//                     ),
//                     ControlCard(
//                       title: 'Favorites',
//                       icon: Icons.favorite,
//                       onTap: () {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('Favorites clicked')),
//                         );
//                       },
//                     ),
//                     ControlCard(
//                       title: 'User List',
//                       icon: Icons.assignment,
//                       onTap: () {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('Settings clicked')),
//                         );
//                       },
//                     ),
//                     ControlCard(
//                       title: 'About US',
//                       icon: Icons.account_circle,
//                       onTap: () {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('Help & Support clicked')),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ControlCard extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final VoidCallback onTap;
//
//   ControlCard({
//     required this.title,
//     required this.icon,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(16),
//       elevation: 6,
//       shadowColor: Colors.deepPurple.withOpacity(0.4),
//       child: InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(16),
//         splashColor: Colors.deepPurple.withOpacity(0.3),
//         child: Container(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(icon, size: 60, color: Colors.deepPurple),
//               SizedBox(height: 15),
//               Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.deepPurple.shade700,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'form_screen.dart';
import 'userlist.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Map<String, String>> users = []; // Store user details here

  // Method to add user from FormScreen
  void addUser(Map<String, String> userData) {
    setState(() {
      users.add(userData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 8,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    ControlCard(
                      title: 'Add User',
                      icon: Icons.edit_note,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormScreen(
                              onSubmit: addUser, // ✅ Pass callback
                            ),
                          ),
                        );
                      },
                    ),
                    ControlCard(
                      title: 'Favorites',
                      icon: Icons.favorite,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Favorites clicked')),
                        );
                      },
                    ),
                    ControlCard(
                      title: 'User List',
                      icon: Icons.assignment,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserListPage(users: users),
                          ),
                        );
                      },
                    ),
                    ControlCard(
                      title: 'About US',
                      icon: Icons.account_circle,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Help & Support clicked')),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ControlCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  ControlCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      elevation: 6,
      shadowColor: Colors.deepPurple.withOpacity(0.4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: Colors.deepPurple.withOpacity(0.3),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 60, color: Colors.deepPurple),
              SizedBox(height: 15),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple.shade700,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
