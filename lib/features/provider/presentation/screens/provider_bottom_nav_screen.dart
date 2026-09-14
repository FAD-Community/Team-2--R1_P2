import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../widgets/provider_bottom_nav_bar.dart';
import 'provider_home_screen.dart';
import 'request_details_screen.dart';
import 'provider_chat_screen.dart';
import 'provider_profile_screen.dart';

class ProviderBottomNavScreen extends StatefulWidget {
  const ProviderBottomNavScreen({super.key});

  @override
  State<ProviderBottomNavScreen> createState() =>
      _ProviderBottomNavScreenState();
}

class _ProviderBottomNavScreenState
    extends State<ProviderBottomNavScreen> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    ProviderHomeScreen(),
    RequestDetailsScreen(),
    ProviderChatScreen(),
    ProviderProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundScaffold,
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),

      bottomNavigationBar: ProviderBottomNavBar(
        currentIndex: currentIndex,
        onItemTapped: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}