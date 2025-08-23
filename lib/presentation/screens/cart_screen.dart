import 'package:flutter/material.dart';
import 'package:goo4/presentation/screens/profile_screen.dart';

class CartScreen extends StatelessWidget {
  final String imagePath;

  const CartScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Screen"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (builder) => ProfileScreen()),
              );
            },
            icon: Icon(Icons.access_alarms_sharp),
          ),
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            imagePath,
            height: 200,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}
