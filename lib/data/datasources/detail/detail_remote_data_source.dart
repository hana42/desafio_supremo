import '../../models/detail/detail_model.dart';

abstract class DetailRemoteDataSource {
  Future<DetailModel> getDetail(String id);
}
