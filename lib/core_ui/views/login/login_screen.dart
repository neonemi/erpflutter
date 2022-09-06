import 'package:erpflutter/core/utils/string_constant.dart';
import 'package:erpflutter/core_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../core/bloc/bloc.dart';
import '../../../core/theme/app_theme.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _phoneNumberController;
  late final LoginCubit _cubit;
  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
        create: (context) {
          _cubit = LoginCubit();
          return _cubit;
        },
        child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginLoading) {
                context.loaderOverlay.show();
              } else {
                context.loaderOverlay.hide();
              }
              if (state is LoginSendOTPSuccess) {}
            },
            child: Scaffold(
                body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/background.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: Center(
                          child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.cover,
                      ))),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    StringConstants.irlWireless,
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.4,
                      color: AppTheme.appWhite,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    StringConstants.login,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.4,
                      color: AppTheme.appWhite,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 80,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: AppTextField(
                            controller: _phoneNumberController,
                            textInputType: TextInputType.emailAddress,
                            hint: StringConstants.enterEmail,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton(
                      onTap: () => _onTapNextButton,
                      text: StringConstants.sendOTP,
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ],
              ),
            ))));
  }

  void _onTapNextButton() {
    _hideKeyboard();
    // TODO : validate mobile number
    if (_phoneNumberController.text.isNotEmpty) {
      _cubit.sendOTP(
        phoneNumber: _phoneNumberController.text,
      );
    } else {
      context.showToast(StringConstants.enterEmail);
    }
  }

  void _hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
