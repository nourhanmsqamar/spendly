import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendly/Login/LoginState.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final fireAuth = FirebaseAuth.instance;

  // Controllers
  final TextEditingController emailControl = TextEditingController();
  final TextEditingController passwordControl = TextEditingController();

  // Form Key for validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login() async {

    if (!formKey.currentState!.validate()) return;

    emit(LoginLoading());

    try {
      await fireAuth.signInWithEmailAndPassword(
        email: emailControl.text.trim(),
        password: passwordControl.text,
      );
      emit(LoginSuccess());

    } on FirebaseAuthException catch (e) {

      String errorMessage = 'Something went wrong, please try again.';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'The email address is badly formatted.';
      } else if (e.code == 'invalid-credential') {
        errorMessage = 'Invalid email or password.';
      }
      emit(LoginFailure(errorMessage));

    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  @override
  Future<void> close() {
    emailControl.dispose();
    passwordControl.dispose();
    return super.close();
  }
}