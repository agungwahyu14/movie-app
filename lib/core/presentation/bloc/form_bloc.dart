import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormBloc {
  // initial
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _forgotPasswordController =
      TextEditingController();

  // get
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get emailController => _emailController;
  TextEditingController get forgotPasswordController =>
      _forgotPasswordController;
  TextEditingController get passwordController => _passwordController;

  // set
}
