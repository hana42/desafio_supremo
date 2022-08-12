import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:desafio_supremo/domain/entities/detail.dart';
import 'package:desafio_supremo/domain/usecases/get_detail.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit(this._getDetail) : super(const DetailInitial());

  final GetDetail _getDetail;

  void getDetail(String id) async {
    final result = await _getDetail.get(id);

    result.fold(
      (failure) => emit(DetailError(failure.message)),
      (data) => emit(DetailSuccess(data)),
    );
  }
}
