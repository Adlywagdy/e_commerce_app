import 'package:e_commerce_app/features/Auth/cubits/authstates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Authcubit extends Cubit<AuthcubitState> {
  Authcubit() : super(AuthcubitInitial());

  void signin({
    required BuildContext context,
    required String? thepassword,
    required String? theconfirmpassword,
  }) {
    emit(AuthcubitLoading());

    if (thepassword == theconfirmpassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("confirmed")));
      emit(AuthcubitSuccess());
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("not confirmed")));
      emit(AuthcubitFailure());
    }
  }
}
