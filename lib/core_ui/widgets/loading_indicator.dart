
import 'package:erpflutter/core/utils/string_constant.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import 'dot_circle_progress_indicator/dot_circle_indicator.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DotCircleProgressLoader(
          //color: color ?? AppTheme.colorWhite,
          color: color ?? AppTheme.appTextColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          StringConstants.loading,
          style: TextStyle(
            color: color ?? AppTheme.appTextColor,
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
