abstract class AuthEvent {}

class CheckAuthStatus extends AuthEvent {}

class SignUpRequested extends AuthEvent {
  final String email;
  final String password;
  final String fullName;

  SignUpRequested(this.email, this.password, this.fullName);
}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested(this.email, this.password);
}

class LogoutRequested extends AuthEvent {}
