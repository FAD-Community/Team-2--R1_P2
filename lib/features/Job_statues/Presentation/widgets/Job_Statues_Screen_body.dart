import 'package:fix_now_team_2/Features/Job_statues/Presentation/widgets/information_container.dart';
import 'package:fix_now_team_2/Features/Job_statues/Presentation/widgets/service_provider_container.dart';
import 'package:flutter/widgets.dart';
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
