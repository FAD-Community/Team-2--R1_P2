import 'package:fix_now_team_2/Features/Job_statues/presentation/widgets/information_container.dart';
import 'package:fix_now_team_2/Features/Job_statues/presentation/widgets/service_provider_continar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobStatuesScreenBody extends StatelessWidget {
  const JobStatuesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InformationContainer(),
        SizedBox(height: 12.h),
        ServiceProviderContinar(),
      ],
    );
  }
}
