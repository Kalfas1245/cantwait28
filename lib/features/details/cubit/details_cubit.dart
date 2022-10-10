import 'package:bloc/bloc.dart';
import 'package:cantwait28/models/item_model.dart';
import 'package:cantwait28/repositories/items_repository.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this._itemRespository) : super(DetailsState(itemModel: null));

  final ItemRespository _itemRespository;

  Future<void> getItemWithID(String id) async {
    final itemModel = await _itemRespository.get(id: id);
    emit(DetailsState(itemModel: itemModel));
  }
}
