import 'dart:async';
import 'dart:developer';

import 'package:fix_now_team_2/core/spacing/size_space.dart';
import 'package:fix_now_team_2/core/widgets/custom_elevated_button.dart';
import 'package:fix_now_team_2/features/auth/presentation/widgets/otp/custom_header_otp.dart';
import 'package:fix_now_team_2/features/auth/presentation/widgets/otp/custom_otp_pinput.dart';
import 'package:fix_now_team_2/features/auth/presentation/widgets/otp/custom_resend_code.dart';
import 'package:fix_now_team_2/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOtpBody extends StatefulWidget {
  const CustomOtpBody({super.key});

  @override
  State<CustomOtpBody> createState() => _CustomOtpBodyState();
}

class _CustomOtpBodyState extends State<CustomOtpBody> {
  final TextEditingController controller = TextEditingController();
  int seconds = 45;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer?.cancel();
    setState(() {
      seconds = 45;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.h),
              child: const CustomHeaderOtp(),
            ),
            20.hSpace,
            CustomOtpPinput(controller: controller, onCompleted: (value) {}),
            30.hSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
              child: CustomElevatedButton(
                onPressed: () {
                  // log(controller.text);
                },
                child: Text(s.verifyButton),
              ),
            ),
            5.hSpace,
            CustomResendCode(
              seconds: seconds,
              onTap: seconds == 0
                  ? () {
                      // هنا بعدين هتعمل API resend
                      startTimer();
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
