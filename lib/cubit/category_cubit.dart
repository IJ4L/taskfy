import 'package:bloc/bloc.dart';

class CategoryCubit extends Cubit<int> {
  CategoryCubit() : super(1);

  void clickCategory(int index) => emit(index);
}
