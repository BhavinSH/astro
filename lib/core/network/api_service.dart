import 'package:astro/features/question/data/models/question_categories_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi()
abstract class APIService {
  factory APIService(Dio dio) {
    return _APIService(dio, baseUrl: "https://staging-api.astrotak.com/api/");
  }

  @GET("question/category/all")
  Future<QuestionCategoriesResponse> getQuestionCategories();
}
