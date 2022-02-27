import 'package:astro/core/models/layer_response.dart';
import 'package:astro/features/profile/data/models/relative_data.dart';

abstract class ProfileRepository {
  Future<LayerResponse<List<RelativeData>>> getAllRelatives();
}
