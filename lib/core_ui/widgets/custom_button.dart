
import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.height,
    required this.width
  }) : super(key: key);
  final String text;
  final double height;
  final double width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height:height,
        width: width,
        decoration: BoxDecoration(
          color: AppTheme.appButton,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: AppTheme.appGrey.withOpacity(0.5),
              offset: const Offset(1, 13),
              blurRadius: 20,
              spreadRadius: -9,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style:  TextStyle(
              color: AppTheme.appWhite,
              fontFamily: "Montserrat",
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
