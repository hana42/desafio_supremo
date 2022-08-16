import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failure.dart';
import '../../../domain/entities/detail.dart';
import '../../../domain/usecases/detail/get_detail_impl.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit(this._getDetail) : super(const DetailInitial());
  final GetDetailImpl _getDetail;

  void getDetail(String id) async {
    final result = await _getDetail(id);

    result.fold(
      (failure) => emit(DetailError(failure)),
      (data) => emit(DetailSuccess(data)),
    );
  }
}
