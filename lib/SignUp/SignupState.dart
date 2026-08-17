abstract class SignupState {}

///=================Initial state===================
class SignupInitial extends SignupState {}

///=================loading state===================
class SignupLoading extends SignupState {}

///==================success state=====================
class SignupSuccess extends SignupState {}

///==================failure state=====================
class SignupFailure extends SignupState {
  final String errMsg;
  SignupFailure(this.errMsg);
}