// import 'package:antiradar/src/core/exceptions/drive_exception.dart';
// import 'package:antiradar/src/core/mappers/position_mapper.dart';
// import 'package:antiradar/src/feature/antiradar/domain/entity/location_entity.dart';
// import 'package:antiradar/src/feature/antiradar/domain/entity/user_position.dart';
// import 'package:geolocator/geolocator.dart';

// base mixin GeoLocatorHelper {
//   Future<UserPosition> fetchUserLocation() async {
//     try {
//       bool serviceEnabled;
//       LocationPermission permission;

//       serviceEnabled = await Geolocator.isLocationServiceEnabled();
//       if (!serviceEnabled) {
//         throw DriveException(message: 'Location services are disabled.');
//       }

//       permission = await Geolocator.checkPermission();
//       if (permission == LocationPermission.denied) {
//         permission = await Geolocator.requestPermission();
//         if (permission == LocationPermission.denied) {
//           throw DriveException(message: 'Permission denied.');
//         }
//       }

//       if (permission == LocationPermission.deniedForever) {
//         throw DriveException(message: 'Permission denied forever.');
//       }

//       final position = await Geolocator.getCurrentPosition();

//       return PositionMapper.of(position);
//     } on Object catch (error, stack) {
//       Error.throwWithStackTrace(error, stack);
//     }
//   }

//   double distanceBetween<T extends LocationEntity>(
//       T cameraPosition, T userPosition) {
//     return Geolocator.distanceBetween(
//       cameraPosition.latitude,
//       cameraPosition.longitude,
//       cameraPosition.latitude,
//       cameraPosition.longitude,
//     );
//   }
// }
