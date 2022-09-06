import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void sendOTP({
    required String phoneNumber,
  }) async {
    emit(LoginLoading());
    try {
      //  OtpSent otpSent = await coreRepository.sendOTP(mobile: phoneNumber);
      // TODO : remove this OTP here
      emit(LoginSendOTPSuccess(''));
    } catch (e) {
      emit(LoginSendOTPError(e.toString()));
    }
  }
}
