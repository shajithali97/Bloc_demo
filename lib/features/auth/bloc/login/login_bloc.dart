import 'package:bloc/bloc.dart';
import 'package:bloc_login_demo/core/utils/validations.dart';
import 'package:bloc_login_demo/features/auth/domain/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  String? emailAddress;
  LoginBloc() : super(LoginInitial()) {
    on<LoginApiEvent>((event, emit) async {
      emit(LoginLoading());
      print(event.email);
      print(event.password);
      if (event.email.isEmpty || event.password.isEmpty) {
        emit(const LoginFailure("Fields are mandatory"));
      } else if (!Validation.emailValidation(event.email)) {
        emit(const LoginFailure("Invalid email address"));
      } else if (!Validation.passwordValidation(event.password)) {
        emit(const LoginFailure("Invalid Password"));
      } else {
        try {
          Map params = {"email": event.email, "password": event.password};
          print(params);
          await AuthRepository().loginApi(params);
          emailAddress = event.email;
          emit(LoginLoaded());
        } catch (e) {
          emit(LoginFailure(e.toString()));
        }
      }
      // TODO: implement event handler
    });
  }
}
