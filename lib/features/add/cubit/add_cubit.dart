import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cantwait28/repositories/items_repository.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit(this._itemRespository) : super(const AddState());

  final ItemRespository _itemRespository;

  Future<void> add(
    String title,
    String imageURL,
    DateTime releaseDate,
  ) async {
    try {
      await _itemRespository.add(title, imageURL, releaseDate);

      emit(const AddState(saved: true));
    } catch (error) {
      emit(AddState(errorMessage: error.toString()));
    }
  }
}
