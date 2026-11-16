import 'package:flutter/material.dart';

class UserListPage extends StatelessWidget {
  final List<Map<String, String>> users;

  const UserListPage({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User List")),
      body: users.isEmpty
          ? Center(child: Text("No users added yet"))
          : ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(user['name'] ?? ''),
              subtitle: Text(
                  "Phone: ${user['phone']} | Age: ${user['age']} | Gender: ${user['gender']}"),
              trailing: Text(user['email'] ?? ''),
            ),
          );
        },
      ),
    );
  }
}
