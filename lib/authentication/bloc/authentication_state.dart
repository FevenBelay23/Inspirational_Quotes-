abstract class AuthState {}

class Idle extends AuthState {}

class LogingIn extends AuthState {}

class LoginFailed extends AuthState {}

class LoginSuccessful extends AuthState {}

class SigningUp extends AuthState {}

class SignUpFailed extends AuthState {}

class SignUpSuccessful extends AuthState {}
