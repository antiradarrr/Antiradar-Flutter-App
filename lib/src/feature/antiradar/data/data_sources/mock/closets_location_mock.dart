import 'package:antiradar/src/core/helpers/audio_player_helper.dart';
import 'package:antiradar/src/feature/antiradar/data/data_sources/closets_location_data_sources.dart';
import 'package:antiradar/src/feature/antiradar/domain/entity/camera_location_entity.dart';
import 'package:antiradar/src/feature/antiradar/domain/entity/nearest_location_entity.dart';

base class MockClosetsLocation
    with AudioPlayerHelper
    implements IClosetsLocationDataSources<CameraLocationEntity> {
  @override
  Future<NearestLocationEntity> fetchClosetsLocation(
      List<CameraLocationEntity> locationList, String langCode) async {
    final location = NearestLocationEntity(60, 500);

    // playAudio(langCode, location);
    return location;
  }
}
