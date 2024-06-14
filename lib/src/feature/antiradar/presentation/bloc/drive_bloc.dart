import 'package:antiradar/src/core/exceptions/drive_exception.dart';
import 'package:antiradar/src/core/extensions/enum_extension.dart';
import 'package:antiradar/src/core/extensions/nearest_location_extension.dart';
import 'package:antiradar/src/core/helpers/audio_player_helper.dart';
import 'package:antiradar/src/core/utils/logger/logger.dart';
import 'package:antiradar/src/feature/antiradar/domain/entity/nearest_location_entity.dart';
import 'package:antiradar/src/feature/antiradar/domain/entity/user_position.dart';
import 'package:antiradar/src/feature/antiradar/domain/enums/speed_limits_status.dart';
import 'package:antiradar/src/feature/antiradar/domain/repositories/camera_local_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../domain/entity/camera_location_entity.dart';
import '../../domain/entity/post_entity.dart';
import '../../domain/repositories/closets_location_repository.dart';

enum DriveStatus { start, stop, failure }

class DriveBloc extends Bloc<DriveEvent, DriveState> {
  final CameraLocalRepository cameraLocalRepository;

  final IClosetsLocationRepository<CameraLocationEntity, UserPosition>
      closetsCameraRepository;
  final IClosetsLocationRepository closetsBlockPostRepository;

  DriveBloc(
    this.closetsCameraRepository,
    this.closetsBlockPostRepository,
    this.cameraLocalRepository,
  ) : super(DriveState()) {
    on<FetchLocalCameraLocation>(_fetchLocalCameraLocation);
    on<FetchClosetsCameraLocation>(_fetchClosetsCameraLocation);
    on<FetchClosetsBlockPost>(_fetchClosetsBlockPostDistance);
  }

  Future<void> _fetchClosetsCameraLocation(
      FetchClosetsCameraLocation event, Emitter<DriveState> emit) async {
    try {
      if (state.cameraIsEmpty) return;

      final nearestCamera = await closetsCameraRepository.fetchClosetsLocation(
          state.cameraLocationList, event.langCode);

      final receivedLimitStatus = nearestCamera.status();

      if (state.speedLimitStatus.compare(receivedLimitStatus)) {
        logger.i(
            'Статусы совпадают аудио не будет воспроизведеннно. Статус состояния${state.speedLimitStatus}  Полученный статус ${nearestCamera.status()}');
      } else {
        emit(state.copyWith(speedLimitStatus: receivedLimitStatus));
        await AudioPlayerHelper.notifyAboutCamera(
            event.langCode, nearestCamera, state.speedLimitStatus);
      }

      emit(state.copyWith(nearestCamera: nearestCamera));
    } on DriveException catch (error, stack) {
      logger.i(error.message, error: error, stackTrace: stack);
      emit(state.copyWith(driveStatus: DriveStatus.failure));
    }
  }

  Future<void> _fetchLocalCameraLocation(
      FetchLocalCameraLocation event, Emitter<DriveState> emit) async {
    try {
      if (!state.cameraIsEmpty) return;

      emit(state.copyWith(driveStatus: DriveStatus.start));

      final cameraLocationList =
          await cameraLocalRepository.fetchCameraLocation();

      emit(state.copyWith(cameraLocationList: cameraLocationList));
    } on Object catch (error, stack) {
      logger.e('[DriveBloc]', error: error, stackTrace: stack);

      emit(state.copyWith(driveStatus: DriveStatus.failure));
    }
  }

  Future<void> _fetchClosetsBlockPostDistance(
      FetchClosetsBlockPost event, Emitter<DriveState> emit) async {
    try {
      final nearestBlockPost = await closetsBlockPostRepository
          .fetchClosetsLocation(state.blockPostList, event.langCode);
      emit(state.copyWith(nearestBlockPost: nearestBlockPost));
    } on DriveException catch (error) {
      logger.e(error.message);
      emit(state.copyWith(driveStatus: DriveStatus.failure));
    }
  }
}

class DriveState {
  DriveState({
    this.blockPostList = const [],
    this.cameraLocationList = const [],
    this.driveStatus = DriveStatus.stop,
    this.nearestCamera,
    this.nearestBlockPost,
    this.locationPermission = LocationPermission.denied,
    this.speedLimitStatus = SpeedLimitStatus.empty,
  });

  List<PostEntity> blockPostList;
  List<CameraLocationEntity> cameraLocationList;
  DriveStatus driveStatus;

  NearestLocationEntity? nearestCamera;
  NearestLocationEntity? nearestBlockPost;
  LocationPermission locationPermission;
  SpeedLimitStatus speedLimitStatus;

  bool get cameraIsEmpty => cameraLocationList.isEmpty ? true : false;

  DriveState copyWith({
    List<PostEntity>? blockPostList,
    List<CameraLocationEntity>? cameraLocationList,
    DriveStatus? driveStatus,
    NearestLocationEntity? nearestCamera,
    NearestLocationEntity? nearestBlockPost,
    UserPosition? userPosition,
    LocationPermission? locationPermission,
    SpeedLimitStatus? speedLimitStatus,
  }) {
    return DriveState(
      blockPostList: blockPostList ?? this.blockPostList,
      cameraLocationList: cameraLocationList ?? this.cameraLocationList,
      driveStatus: driveStatus ?? this.driveStatus,
      nearestBlockPost: nearestBlockPost ?? this.nearestBlockPost,
      nearestCamera: nearestCamera ?? this.nearestCamera,
      locationPermission: locationPermission ?? this.locationPermission,
      speedLimitStatus: speedLimitStatus ?? this.speedLimitStatus,
    );
  }
}

abstract class DriveEvent {}

final class FetchLocalCameraLocation extends DriveEvent {}

final class FetchClosetsCameraLocation extends DriveEvent {
  final String langCode;

  FetchClosetsCameraLocation({required this.langCode});
}

final class FetchClosetsBlockPost extends DriveEvent {
  final String langCode;

  FetchClosetsBlockPost({required this.langCode});
}
