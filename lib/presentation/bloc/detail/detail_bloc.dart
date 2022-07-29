import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:desafio_supremo/presentation/bloc/detail/detail_state.dart';

import '../../../domain/usecases/get_detail.dart';
import 'detail_event.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetDetail _getDetail;

  DetailBloc(this._getDetail) : super(DetailEmpty()) {
    on<FetchDetail>((event, emit) async {
      emit(DetailLoading());

      final result = await _getDetail.get(event.id);
      result.fold(
        (failure) {
          emit(DetailError(failure.message));
        },
        (data) {
          emit(DetailHasData(data));
        },
      );
    });
  }
}
