
import 'package:flutter_bloc/flutter_bloc.dart';
part 'count_bloc_state.dart';

class CountCubit extends Cubit<CountState> {
  CountCubit() : super(CountState(counter: 0,isAdd: true));

  void increment() => emit(CountState(counter: state.counter + 1,isAdd: true));
  void decrement() => emit(CountState(counter: state.counter - 1,isAdd: false));
  }

