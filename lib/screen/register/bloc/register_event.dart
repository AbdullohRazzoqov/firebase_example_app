part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}
class InputPhoneEvent extends RegisterEvent{}
class InputEmailEvent extends RegisterEvent{}
class InputPasswordEvent extends RegisterEvent{}
class InputConfarmPasswordEvent extends RegisterEvent{}
