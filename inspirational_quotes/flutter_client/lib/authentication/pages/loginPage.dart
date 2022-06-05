import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/admin/blocs/quote/quote_bloc.dart';
import 'package:flutter_client/appuser/blocs/favorite/favorite_bloc.dart';
import 'package:flutter_client/authentication/models/loginModel.dart';
import 'package:flutter_client/utilities/ColorPallets.dart';
import 'package:flutter_client/widgets/customButton.dart';
import 'package:flutter_client/widgets/customeTextField.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../blocs/login/login_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final emailTextEditingController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            showTopSnackBar(
              context,
              SizedBox(
                width: 20,
                child: CustomSnackBar.success(
                    messagePadding: const EdgeInsets.all(0),
                    icon: Container(),
                    message: "Login sucess"),
              ),
              additionalTopPadding: 0,
              displayDuration: const Duration(milliseconds: 500),
            );
            context.read<QuoteBloc>().add(
                  GetAllQuotes(token: state.token),
                );
            if (state.loggedUser.role == "admin") {
              GoRouter.of(context).go("/admin");
            } else {
              context.read<FavoriteBloc>().add(
                    GetFavoriteQuotes(
                        userId: state.loggedUser.id!, token: state.token),
                  );
              GoRouter.of(context).go("/user");
            }
          }
          if (state is LoginLoading) {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return const Center(
                  child: SpinKitSpinningLines(
                    size: 50,
                    color: Colors.deepPurpleAccent,
                  ),
                );
              },
            ).then((value) {});
          }
          if (state is LoginFailed) {
            showTopSnackBar(
              context,
              SizedBox(
                width: 20,
                child: CustomSnackBar.error(
                    messagePadding: const EdgeInsets.all(0),
                    icon: Container(),
                    message: "Login  Failed"),
              ),
              additionalTopPadding: 0,
              displayDuration: const Duration(milliseconds: 500),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 300,
                  ),
                  customTextField(
                    Icons.email,
                    false,
                    true,
                    hintText: "Email",
                    validator: (value) {
                      if (!EmailValidator.validate(value!)) {
                        return "invalid email";
                      }
                      return null;
                    },
                    controller: emailTextEditingController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  customTextField(
                    Icons.password,
                    true,
                    false,
                    hintText: "Password",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "* required";
                      }
                      return null;
                    },
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    backroundcolor: ColorPalettes.iconColor,
                    displaytext: const Text("sign in"),
                    onPressedfun: () {
                      var formState = formKey.currentState;
                      if (formState!.validate()) {
                        var loginModel = LoginModel(
                            email: emailTextEditingController.text,
                            password: passwordController.text);

                        context.read<LoginBloc>().add(
                              Login(loginModel: loginModel),
                            );
                      }
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      context.go("/signup");
                    },
                    child: const Text(
                      "Don't have account?",
                      // style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}