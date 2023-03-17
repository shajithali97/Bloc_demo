import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/validations.dart';
import '../../domain/repo/auth_repo.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterApiEvent>((event, emit) async {
      emit(RegisterLoading());
      print(event.email);
      print(event.password);
      if (event.email.isEmpty || event.password.isEmpty) {
        emit(const RegisterFailure("Fields are mandatory"));
      } else if (!Validation.emailValidation(event.email)) {
        emit(const RegisterFailure("Invalid email address"));
      } else if (!Validation.passwordValidation(event.password)) {
        emit(const RegisterFailure("Invalid Password"));
      } else {
        try {
          Map params = {"email": event.email, "password": event.password};
          print(params);
          await AuthRepository().registerApi(params);
          emit(RegisterLoaded());
        } catch (e) {
          emit(RegisterFailure(e.toString()));
        }
      }
    });
  }
}
