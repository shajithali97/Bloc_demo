part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginApiEvent extends LoginEvent {
  final String email;
  final String password;

  const LoginApiEvent(this.email, this.password);
}
