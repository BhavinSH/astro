import 'package:astro/features/profile/data/models/relatives_response.dart';
import 'package:astro/features/question/data/models/question_categories_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart' as http;

part 'api_service.g.dart';

@http.RestApi()
abstract class APIService {
  factory APIService(Dio dio) {
    return _APIService(dio, baseUrl: "https://staging-api.astrotak.com/api/");
  }

  @http.GET("question/category/all")
  Future<QuestionCategoriesResponse> getQuestionCategories();

  @http.GET("relative/all")
  @http.Headers(<String, dynamic>{
    "Content-Type": "application/json",
    "Authorization":
        "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI4ODA5NzY1MTkxIiwiUm9sZXMiOltdLCJleHAiOjE2NzY0NjE0NzEsImlhdCI6MTY0NDkyNTQ3MX0.EVAhZLNeuKd7e7BstsGW5lYEtggbSfLD_aKqGFLpidgL7UHZTBues0MUQR8sqMD1267V4Y_VheBHpxwKWKA3lQ"
  })
  Future<RelativeResponse> getAllRelatives();
}
