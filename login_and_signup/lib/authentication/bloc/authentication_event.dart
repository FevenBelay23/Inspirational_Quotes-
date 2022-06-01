abstract class AuthEvent {}

class Login extends AuthEvent {
  final String email;
  final String password;
  Login(this.email, this.password);
}

class SignUp extends AuthEvent {
  final String name;
  final String email;
  final String password;
  SignUp(this.name,this.email, this.password);
}
