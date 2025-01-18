import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/theme/app_text_styles_and_text_theme/app_text_styles.dart';
import 'package:provider/provider.dart';

import '../../../../common_mvc/common_controller/user_controller.dart';

class ProfileDataWidget extends StatefulWidget {
  const ProfileDataWidget({super.key});

  @override
  State<ProfileDataWidget> createState() => _ProfileDataWidgetState();
}

class _ProfileDataWidgetState extends State<ProfileDataWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserControllerProvider>(
      builder: (context, userController, child) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "Mohamed Raslan",
                style: AppTextStyles.titleMedium,
              ),
              const SizedBox(height: 20),
              Text(
                'Donation Points:',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),
              Text(
                userController.points.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  userController.loadUserPoints();
                },
                child: const Text('Refresh Points'),
              ),
            ],
          ),
        );
      },
    );
  }
}
