import 'package:bloc_lesson/validate/validate_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValidateCubit extends Cubit<ValidateState> {
  ValidateCubit() : super(ValidateState());

  void isTrue(String text) {
    if (text == 'test') {
      emit(state.copyWith(isTrue: true));
    } else {
      emit(state.copyWith(isTrue: false));
    }
  }
}
