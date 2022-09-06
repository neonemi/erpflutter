part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSendOTPSuccess extends LoginState {
  const LoginSendOTPSuccess(this.otp);
  final String otp;
  @override
  List<Object> get props => [otp];
}

class LoginSendOTPError extends LoginState {
  const LoginSendOTPError(this.message);
  final String message;
  @override
  List<Object> get props => [message];
}
