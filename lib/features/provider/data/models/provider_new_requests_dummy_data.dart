import 'package:fix_now_team_2/features/provider/data/models/provider_request_dummy_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../presentation/widgets/provider_home/provider_request_card.dart';

class ProviderNewRequestsDummy extends StatelessWidget {
  const ProviderNewRequestsDummy({super.key});

  static const List<ProviderRequestDummyModel> requests = [
    ProviderRequestDummyModel(
      iconPath: 'assets/icons/water_leakage_icon.svg',
      serviceName: 'Water Leakage',
      description: 'Water leaking from the bottom',
      date: 'Aug 24, 2026 - 5 AM',
      distance: '3,2 KM away',
    ),
    ProviderRequestDummyModel(
      iconPath: 'assets/icons/power_failure_icon.svg',
      serviceName: 'Power Failure',
      description: 'Washer doesn’t turn on at all',
      date: 'Today - 11 AM',
      distance: '1,2 KM away',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 186.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: requests.length,
        separatorBuilder: (_, __) => SizedBox(width: 16.w),
        itemBuilder: (context, index) {
          return ProviderRequestCard(
            request: requests[index],
          );
        },
      ),
    );
  }
}