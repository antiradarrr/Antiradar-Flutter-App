import 'package:antiradar/src/feature/antiradar/data/data_sources/closets_location_data_sources.dart';
import 'package:antiradar/src/feature/antiradar/domain/entity/nearest_location_entity.dart';
import 'package:antiradar/src/feature/antiradar/domain/entity/post_entity.dart';
import 'package:antiradar/src/feature/antiradar/domain/entity/user_position.dart';
import 'package:antiradar/src/feature/antiradar/domain/repositories/closets_location_repository.dart';

base class PostClosetsLocationRepositoryImpl
    implements IClosetsLocationRepository<PostEntity, UserPosition> {
  PostClosetsLocationRepositoryImpl({required this.closetsLocationDataSources});

  final IClosetsLocationDataSources closetsLocationDataSources;

  @override
  Future<NearestLocationEntity> fetchClosetsLocation(
      List<PostEntity> locationList, String langCode) async {
    return await closetsLocationDataSources.fetchClosetsLocation(locationList, langCode);
  }
}
