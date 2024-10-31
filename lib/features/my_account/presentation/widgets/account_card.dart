import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/core/theme/app_colors.dart';

Widget buildActionCard(String title, String subtitle, IconData icon) {
  return Card(
    color: AppColors.backgroundLighterNavyBlue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 60, color: AppColors.gold,),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 40)),
          SizedBox(height: 4),
          Text(subtitle, style: TextStyle(color: Colors.white70, fontSize: 20, fontStyle: FontStyle.italic)),
        ],
      ),
    ),
  );
}
