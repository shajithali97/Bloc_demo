part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterApiEvent extends RegisterEvent {
  final String email;
  final String password;

  const RegisterApiEvent(this.email, this.password);
}
