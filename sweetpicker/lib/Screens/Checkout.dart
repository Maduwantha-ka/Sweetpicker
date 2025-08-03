import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  final double totalAmount;

  const CheckoutScreen({super.key, required this.totalAmount});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController addressController = TextEditingController();

  String selectedPayment = 'Cash on Delivery';

  void _placeOrder() {
    if (_formKey.currentState!.validate()) {
      // TODO: Handle order submission
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Order placed successfully!')));
      Navigator.pop(context); // Return to previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkout'), backgroundColor: Colors.orange),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                'Delivery Address',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: addressController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Enter your full delivery address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Address is required'
                    : null,
              ),
              SizedBox(height: 30),

              Text(
                'Payment Method',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: selectedPayment,
                items:
                    [
                      'Cash on Delivery',
                      'Credit/Debit Card',
                      'Mobile Payment',
                    ].map((method) {
                      return DropdownMenuItem(
                        value: method,
                        child: Text(method),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() => selectedPayment = value!);
                },
              ),
              SizedBox(height: 30),

              Text(
                'Total: \$${widget.totalAmount.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),

              ElevatedButton(
                onPressed: _placeOrder,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Place Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
