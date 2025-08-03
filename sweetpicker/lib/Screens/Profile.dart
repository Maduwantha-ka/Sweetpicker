import 'package:flutter/material.dart';
import 'login.dart';
import 'OrderHistrory.dart';
import 'EditProfilePage.dart';

class ProfileScreen extends StatelessWidget {
  final String userName = 'John Doe';
  final String email = 'johndoe@example.com';

  const ProfileScreen({super.key});

  void _logout(BuildContext context) {
    // Navigate back to login (clear stack)
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Profile'), backgroundColor: Colors.orange),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // 👤 Avatar
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.orange[200],
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            SizedBox(height: 16),
            // 📝 Name & Email
            Text(
              userName,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(email, style: TextStyle(color: Colors.grey[600])),
            SizedBox(height: 30),

            // 📦 Buttons
            ListTile(
              leading: Icon(Icons.edit, color: Colors.orange),
              title: Text('Edit Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.history, color: Colors.orange),
              title: Text('Order History'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderHistoryScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.orange),
              title: Text('Settings'),
              onTap: () {
                // TODO: Implement Settings
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text('Logout'),
              onTap: () => _logout(context),
            ),
          ],
        ),
      ),
    );
  }
}
