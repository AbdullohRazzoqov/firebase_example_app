import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  String password = '';
  String email = '';
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});
  }
  bool isValidation(String email, String password) {
    if (email.length >= 12 && password.length >= 8) {
      return true;
    } else {
      return false;
    }
  }
}
