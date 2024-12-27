import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common_mvc/common_controller/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Points')),
      body: Center(
        child: Consumer<UserControllerProvider>(
          builder: (context, userController, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your Points:',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 10),
                Text(
                  '${userController.points}', // Access points from the controller
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    userController.loadUserPoints(); // Load or refresh points
                  },
                  child: Text('Refresh Points'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}