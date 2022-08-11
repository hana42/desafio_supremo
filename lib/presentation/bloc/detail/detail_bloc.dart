import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:desafio_supremo/domain/entities/detail.dart';
import 'package:desafio_supremo/domain/usecases/get_detail.dart';

part 'detail_state.dart';

class DetailBloc extends Cubit<DetailState> {
  DetailBloc(this._getDetail) : super(const DetailState());

  final GetDetail _getDetail;

  void onFetchDetail(String id) async {
    final detail = await _getDetail.get(id);

    detail.fold(
      (failure) => emit(
        state.copyWith(
          status: DetailStatus.failure,
        ),
      ),
      (data) => emit(
        state.copyWith(
          status: DetailStatus.success,
          detail: data,
        ),
      ),
    );
  }
}
