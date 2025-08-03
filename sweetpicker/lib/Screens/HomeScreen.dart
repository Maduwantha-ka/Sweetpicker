import 'package:flutter/material.dart';
import 'Profile.dart';
import 'OrderHistrory.dart';
import 'CartScreen.dart';

class HomeScreen extends StatelessWidget {
  final List<String> categories = ['Pizza', 'Burgers', 'Drinks', 'Desserts'];

  final List<Map<String, String>> restaurants = [
    // {'name': 'Pizza', 'image': 'https://wallpapercave.com/uwp/uwp4338965.png'},
    // {'name': 'cake', 'image': 'https://wallpapercave.com/uwp/uwp4350348.png'},
    // {'name': 'Sweet Desserts', 'image': 'https://via.placeholder.com/150'},
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foodie Express'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔍 Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search food or restaurants',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),

            // 🍽️ Categories
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 12),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.orange[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Text(categories[index])),
                  );
                },
              ),
            ),
            SizedBox(height: 20),

            // 🍴 Restaurant List
            Expanded(
              child: ListView.builder(
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = restaurants[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      leading: Image.network(restaurant['image']!),
                      title: Text(restaurant['name']!),
                      subtitle: Text('Delicious food waiting for you!'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // TODO: Navigate to restaurant details
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // 📱 Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderHistoryScreen()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartScreen()),
            );
          }
        },
      ),
    );
  }
}
