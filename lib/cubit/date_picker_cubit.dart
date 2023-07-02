import 'package:bloc/bloc.dart';

class DatePickerCubit extends Cubit<int> {
  final int dateNow;
  DatePickerCubit({required this.dateNow}) : super(dateNow - 1);

  void clickDate(int index) => emit(index);
}
