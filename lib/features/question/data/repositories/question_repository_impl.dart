import 'package:astro/core/error/failure.dart';
import 'package:astro/core/models/layer_response.dart';
import 'package:astro/core/network/network_info.dart';
import 'package:astro/features/question/data/datasources/question_data_source.dart';
import 'package:astro/features/question/data/models/question_category_data.dart';
import 'package:astro/features/question/domain/repositories/question_repository.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final QuestionDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  QuestionRepositoryImpl(this.remoteDataSource, this.networkInfo);

  @override
  Future<LayerResponse<List<QuestionCategoryData>>>
      getQuestionCategories() async {
    if (await networkInfo.isConnected) {
      var response = await remoteDataSource.getQuestionCategories();
      if (response.data != null) {
        return LayerResponse(data: response.data);
      } else {
        return LayerResponse(failure: ServerFailure());
      }
    } else {
      return LayerResponse(failure: NetworkConnectionFailure());
    }
  }
}
