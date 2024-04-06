import 'package:flutter/material.dart';

class UserOrdersScreen extends StatelessWidget {
  const UserOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your orders',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.asset("assets/icons/lotion.png"),
                title: const Text(
                  'Order placed on 19/03/2024',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: const Text(
                  'name',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              height: 1.5,
              width: double.infinity,
              color: Colors.grey,
            );
          },
          itemCount: 2,
        ),
      ),
    );
  }
}
