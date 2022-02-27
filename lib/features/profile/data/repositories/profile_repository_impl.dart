import 'package:astro/core/error/failure.dart';
import 'package:astro/core/network/network_info.dart';
import 'package:astro/features/profile/data/datasources/profile_data_source.dart';
import 'package:astro/features/profile/data/models/relative_data.dart';
import 'package:astro/core/models/layer_response.dart';
import 'package:astro/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProfileRepositoryImpl(this.remoteDataSource, this.networkInfo);

  @override
  Future<LayerResponse<List<RelativeData>>> getAllRelatives() async {
    if (await networkInfo.isConnected) {
      var response = await remoteDataSource.getAllRelatives();
      if (response.data != null) {
        return LayerResponse(data: response.data!.allRelatives);
      } else {
        return LayerResponse(failure: ServerFailure());
      }
    } else {
      return LayerResponse(failure: NetworkConnectionFailure());
    }
  }
}
