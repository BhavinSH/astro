import 'package:astro/core/network/api_service.dart';
import 'package:astro/features/profile/data/models/relatives_response.dart';
import 'package:astro/features/question/data/models/question_categories_response.dart';

abstract class ProfileDataSource {
  Future<RelativeResponse> getAllRelatives();
}

class ProfileDataSourceImpl implements ProfileDataSource {
  APIService _apiService;

  ProfileDataSourceImpl(this._apiService);

  @override
  Future<RelativeResponse> getAllRelatives() async {
    return await _apiService.getAllRelatives();
  }
}
