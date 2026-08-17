import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'SignupState.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  ///==================object firebaseAuth==============
  final fireAuth = FirebaseAuth.instance;

  ///=================controllers========
  final TextEditingController nameControl = TextEditingController();
  final TextEditingController emailControl = TextEditingController();
  final TextEditingController passwordControl = TextEditingController();
  final TextEditingController confirmPasswordControl = TextEditingController();

  ///=================Form Key========
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    // التحقق من صحة الحقول قبل إرسال الطلب لفايربيز
    if (!formKey.currentState!.validate()) return;

    emit(SignupLoading());

    try {
      // إنشاء الحساب في فايربيز
      UserCredential userCredential = await fireAuth.createUserWithEmailAndPassword(
        email: emailControl.text.trim(),
        password: passwordControl.text,
      );

      // (اختياري) إضافة اسم المستخدم للبروفايل بتاعه في فايربيز
      await userCredential.user?.updateDisplayName(nameControl.text.trim());

      emit(SignupSuccess());

      ///==========handel error
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Something went wrong, please try again.';
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'The email address is badly formatted.';
      }
      emit(SignupFailure(errorMessage));
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }

  @override
  Future<void> close() {
    nameControl.dispose();
    emailControl.dispose();
    passwordControl.dispose();
    confirmPasswordControl.dispose();
    return super.close();
  }
}