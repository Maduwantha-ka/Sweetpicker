import 'package:flutter/material.dart';
import 'package:sweetpicker/login.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = "Jane Doe";
  String email = "jane.doe@email.com";
  String phone = "+1 234 567 8901";

  final List<Map<String, String>> orderHistory = [
    {'title': 'Margherita Pizza', 'date': '2024-06-01', 'price': '\$12.99'},
    {'title': 'Cheeseburger', 'date': '2024-05-28', 'price': '\$9.99'},
    {'title': 'Salmon Sushi', 'date': '2024-05-20', 'price': '\$14.99'},
  ];

  void _editProfile() {
    showDialog(
      context: context,
      builder: (context) {
        final nameController = TextEditingController(text: userName);
        final emailController = TextEditingController(text: email);
        final phoneController = TextEditingController(text: phone);
        return AlertDialog(
          title: Text('Edit Profile'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: 'Phone'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  userName = nameController.text;
                  email = emailController.text;
                  phone = phoneController.text;
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Logged out!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.orange,
        actions: [IconButton(icon: Icon(Icons.edit), onPressed: _editProfile)],
      ),
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/women/44.jpg',
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  userName,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(email, style: TextStyle(color: Colors.grey[700])),
                SizedBox(height: 4),
                Text(phone, style: TextStyle(color: Colors.grey[700])),
              ],
            ),
          ),
          SizedBox(height: 32),
          Text(
            'Order History',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ...orderHistory.map(
            (order) => Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.fastfood, color: Colors.orange),
                title: Text(order['title']!),
                subtitle: Text('Date: ${order['date']}'),
                trailing: Text(order['price']!),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Order: ${order['title']}')),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 32),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.grey[700]),
            title: Text('Settings'),
            onTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Settings tapped')));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text('Logout'),
            onTap: _logout,
          ),
        ],
      ),
      backgroundColor: Colors.grey[50],
    );
  }
}
