part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class InputEmail extends LoginEvent {
  final String inputText;
  const InputEmail({required this.inputText});
}

class InputPassword extends LoginEvent {
  final String inputText;
  const InputPassword({required this.inputText});
}
