import 'package:bloc/bloc.dart';

class OpacityCubit extends Cubit<int> {
  OpacityCubit() : super(0);

  void opacitySwitch(int index) => emit(index);
}
