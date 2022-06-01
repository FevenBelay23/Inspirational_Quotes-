import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_signup/authentication/bloc/authentication_bloc.dart';
import 'package:login_and_signup/authentication/bloc/authentication_event.dart';
import 'package:login_and_signup/authentication/bloc/authentication_state.dart';
import 'package:login_and_signup/home/index.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: emailCtrl,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (String? email) {
                    if (email == null || email.isEmpty) {
                      return "Email must not be empty";
                    }

                    final emailTest = RegExp("[A-Za-z]@[A-Za-z].[A-Za-z]");
                    final emailValid = emailTest.hasMatch(email);
                    return emailValid ? null : "Email not valid";
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: passCtrl,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (String? password) {
                    if (password == null || password.isEmpty) {
                      return "Password must not be empty";
                    }

                    return password.length >= 8 ? null : "Password too short";
                  },
                ),
                SizedBox(height: 30),
                BlocConsumer<AuthBloc, AuthState>(
                  listenWhen: (_, current) {
                    return current is LoginSuccessful;
                  },
                  listener: (_, AuthState state) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => test()),
                    );
                  },
                  builder: (_, AuthState state) {
                    Widget buttonChild = Text("Log in");
                    if (state is LogingIn) {
                      buttonChild = const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }

                    if (state is LoginSuccessful) {
                      buttonChild = const Text("Login successful");
                    }

                    if (state is LoginFailed) {
                      buttonChild = const Text("Login failed");
                    }

                    return ElevatedButton(
                      onPressed: state is LogingIn
                          ? null
                          : () {
                              final formValid =
                                  formKey.currentState!.validate();
                              if (!formValid) return;

                              final authBloc =
                                  BlocProvider.of<AuthBloc>(context);
                              authBloc
                                  .add(Login(emailCtrl.text, passCtrl.text));
                            },
                      child: buttonChild,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
