// import 'dart:async';
// import 'dart:ui';

// import 'package:antiradar/src/core/exceptions/drive_exception.dart';
// import 'package:antiradar/src/core/utils/logger/logger.dart';
// import 'package:antiradar/src/feature/antiradar/domain/entity/nearest_location_entity.dart';
// import 'package:antiradar/src/feature/antiradar/presentation/bloc/drive_bloc.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/cupertino.dart';

// import '../../feature/antiradar/domain/enums/speed_limits_status.dart';

// base mixin class AudioPlayerHelper {
//   static Future<void> notifyAboutCamera(
//     String langCode,
//     NearestLocationEntity nearestLocationEntity,
//     SpeedLimitStatus speedLimitStatus,
//   ) async {
//     try {
//       var distanceParams = (
//         distance: nearestLocationEntity.distanceInMeters,
//         speedLimitStatus: speedLimitStatus
//       );
//       await AssetsAudioPlayer.newPlayer().open(
//         Audio(
//             'assets/audio/${_language(langCode)}/${_distance(distanceParams)}m${_speedLimit(nearestLocationEntity.speedLimit)}.mp3'),
//         autoStart: true,
//       );

//       logger.i(
//           'assets/audio/${_language(langCode)}/${_distance(distanceParams)}m${_speedLimit(nearestLocationEntity.speedLimit)}.mp3');
//     } on DriveException catch (error) {
//       throw DriveException(message: error.message);
//     } on Object catch (error, stack) {
//       logger.e('message', error: error, stackTrace: stack);
//       Error.throwWithStackTrace(error, stack);
//     }
//   }
// }

// int _speedLimit(int speedLimit) {
//   return switch (speedLimit) {
//     == 40 => 40,
//     == 60 => 60,
//     == 120 => 120,
//     _ => 60
//   };
// }

// int _distance(
//     ({double distance, SpeedLimitStatus speedLimitStatus}) speedRecord) {
//   try {
//     switch (speedRecord) {
//       case (
//           distance: (<= 800 && > 500),
//           speedLimitStatus: SpeedLimitStatus.eightHundred
//         ):
//         return 800;

//       case (
//           distance: (<= 500 && > 300),
//           speedLimitStatus: SpeedLimitStatus.fiveHundred
//         ):
//         return 500;

//       case (
//           distance: (<= 300 && > 0),
//           speedLimitStatus: SpeedLimitStatus.threeHundred
//         ):
//         return 300;
//       default:
//         {
//           debugPrint('Speed is :${speedRecord.distance}');
//           throw DriveException(message: 'Location not compared.');
//         }
//     }
//   } on DriveException catch (error, stack) {
//     Error.throwWithStackTrace(error, stack);
//   }
// }

// // void speedLimit(({int meters, SpeedLimitStatus speedLimitStatus}) speed) {}

// // int _distance(double meters, SpeedLimitStatus speedLimitStatus) {
// //   return switch ({meters, speedLimitStatus}) {
// //   me <= 800 && > 500 && (== SpeedLimitStatus.fiveHundred.index) => 800,
// //   <= 500 && > 300 => 500,
// //   <= 300 => 300,
// //   _ => 0
// //   };
// // }

// String _language(String langCode) {
//   return switch (langCode) {
//     == 'en' => 'english_voice',
//     == 'pt' => 'brazilian_voice',
//     == 'ru' => 'russian_voice',
//     == 'es' => 'spanish_voice',
//     _ => 'russian_voice'
//   };
// }
