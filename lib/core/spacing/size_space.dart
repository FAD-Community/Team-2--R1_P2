import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SpacingExtension on num {
  Widget get hSpace => SizedBox(height: toDouble().h);

  Widget get wSpace => SizedBox(width: toDouble().w);
}
