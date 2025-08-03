import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  final List<Map<String, String>> orders = [
    {
      'restaurant': 'Pizza House',
      'date': '2025-07-01',
      'total': '\$18.50',
      'status': 'Delivered',
    },
    {
      'restaurant': 'Burger Town',
      'date': '2025-06-28',
      'total': '\$12.00',
      'status': 'Canceled',
    },
    {
      'restaurant': 'Sushi Rollers',
      'date': '2025-06-25',
      'total': '\$25.30',
      'status': 'Delivered',
    },
  ];

  OrderHistoryScreen({super.key});

  Color getStatusColor(String status) {
    switch (status) {
      case 'Delivered':
        return Colors.green;
      case 'Canceled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: Icon(Icons.restaurant, color: Colors.orange),
              title: Text(order['restaurant']!),
              subtitle: Text(
                'Date: ${order['date']} \nTotal: ${order['total']}',
              ),
              trailing: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: getStatusColor(order['status']!),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  order['status']!,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () {
                // TODO: Show detailed order info (if needed)
              },
            ),
          );
        },
      ),
    );
  }
}
