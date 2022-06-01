import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_signup/authentication/bloc/authentication_event.dart';
import 'package:login_and_signup/authentication/bloc/authentication_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Idle()) {
    on<Login>(_onLogin);
    on<SignUp>(_onSignUp);
  }
}

void _onLogin(Login event, Emitter emit) async {
  print("email ${event.email} :: pass ${event.password}");
  emit(LogingIn());
  await Future.delayed(const Duration(seconds: 3));
  emit(LoginSuccessful());
}

void _onSignUp(SignUp event, Emitter emit) async {
  print("name ${event.name} :: email ${event.email} :: pass ${event.password}");
  emit(SigningUp());
  await Future.delayed(const Duration(seconds: 3));
  emit(SignUpSuccessful());
}
