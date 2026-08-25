import 'package:fix_now_team_2/core/spacing/size_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgRow extends StatelessWidget {
  const CustomSvgRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: const BoxDecoration(
            color: Color(0xFFD3E3FF),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/google.svg',
              width: 20,
              height: 20,
            ),
          ),
        ),
        16.wSpace,
        Container(
          width: 45,
          height: 45,
          decoration: const BoxDecoration(
            color: Color(0xFFD3E3FF),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/facebook.svg',
              width: 20,
              height: 20,
            ),
          ),
        ),
        16.wSpace,
        Container(
          width: 45,
          height: 45,
          decoration: const BoxDecoration(
            color: Color(0xFFD3E3FF),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/apple.svg',
              width: 20,
              height: 20,
            ),
          ),
        ),
      ],
    );
  }
}
