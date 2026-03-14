import 'package:e_commerce_app/core/api_helper.dart';
import 'package:e_commerce_app/features/Auth/Screens/signinscreen.dart';
import 'package:e_commerce_app/features/Auth/cubits/authcubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(create: (context) => Authcubit(), child: Apiscreen()),
    );
  }
}
