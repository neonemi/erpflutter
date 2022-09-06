import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/theme/app_theme.dart';

// TODO : add remaining configuration
class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.controller,
    this.hint,
    this.textInputType,
    this.inputFormatter,
    this.maxLength,
  }) : super(key: key);
  final TextEditingController controller;
  final String? hint;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:AppTheme.appWhite,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: TextFormField(
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(fontWeight: FontWeight.w500),
        textAlign: TextAlign.start,
        controller: controller,
        onChanged: (value) {},
        maxLines: 1,
        maxLength: maxLength,
        inputFormatters: inputFormatter,
        decoration: InputDecoration(
          hintText: hint ?? "",
          isDense: true,
          counterText: "",
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          hintStyle: TextStyle(color: AppTheme.appGrey.withOpacity(0.5)),
        ),
        textInputAction: TextInputAction.done,
        keyboardType: textInputType ?? TextInputType.text,
      ),
    );
  }
}
