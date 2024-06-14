import 'package:antiradar/src/core/exceptions/drive_exception.dart';
import 'package:antiradar/src/core/helpers/audio_player_helper.dart';
import 'package:antiradar/src/core/helpers/geolocator_helper.dart';
import 'package:antiradar/src/feature/antiradar/domain/entity/camera_location_entity.dart';
import 'package:antiradar/src/feature/antiradar/domain/entity/post_entity.dart';
import 'package:antiradar/src/feature/antiradar/domain/entity/location_entity.dart';
import 'package:antiradar/src/feature/antiradar/domain/entity/nearest_location_entity.dart';

abstract interface class IClosetsLocationDataSources<E extends LocationEntity> {
  Future<NearestLocationEntity> fetchClosetsLocation(
    List<E> locationList,
    String langCode,
  );
}

base class CameraClosetsLocationDataSources
    with GeoLocatorHelper, AudioPlayerHelper
    implements IClosetsLocationDataSources<CameraLocationEntity> {
  @override
  Future<NearestLocationEntity> fetchClosetsLocation(
    List<CameraLocationEntity> locationList,
    String langCode,
  ) async {
    try {
      final userLocation = await fetchUserLocation();
      for (var elements in locationList) {
        final closetsDistance = distanceBetween(elements, userLocation);

        if (closetsDistance > 800) {
          var loc = NearestLocationEntity(elements.speedLimit, closetsDistance);
          // playAudio(langCode, loc);

          return loc;
        }
      }
      throw DriveException(message: 'No nearby positions found');
    } on Object catch (error, stack) {
      Error.throwWithStackTrace(error, stack);
    }
  }
}

base class PostLocationDataSources
    with GeoLocatorHelper
    implements IClosetsLocationDataSources<PostEntity> {
  @override
  Future<NearestLocationEntity> fetchClosetsLocation(
    List<PostEntity> locationList,
    String langCode,
  ) async {
    try {
      final userLocation = await fetchUserLocation();
      for (var elements in locationList) {
        final closetsDistance = distanceBetween(elements, userLocation);

        if (closetsDistance > 800) {
          return NearestLocationEntity.getPost(closetsDistance);
        }
      }

      throw DriveException(message: 'No nearby positions found');
    } on Object catch (error, stack) {
      Error.throwWithStackTrace(error, stack);
    }
  }
}
