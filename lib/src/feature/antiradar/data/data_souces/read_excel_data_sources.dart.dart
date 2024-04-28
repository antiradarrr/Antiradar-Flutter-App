import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:antiradar/src/core/utils/logger/logger.dart';
import 'package:antiradar/src/feature/antiradar/data/mappers/location_mapper.dart';
import 'package:antiradar/src/feature/antiradar/data/model/location_model.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:antiradar/src/feature/antiradar/data/model/camera_position_model.dart';

/// {@template read_excel_data_sources.dart}
/// IReadExcelDataSources.
/// {@endtemplate}
abstract interface class IReadExcelDataSources {
  /// {@macro read_excel_data_sources.dart}
  Future<List<CameraPositionModel>> readXLSX();
  List<LocationModel> parseLocation(
      List<CameraPositionModel> locationModelList);
}

/// {@template read_excel_data_sources.dart}
/// ReadExcelDataSources.
/// {@endtemplate}
base class ReadExcelDataSources implements IReadExcelDataSources {
  /// {@macro read_excel_data_sources.dart}

  @override
  List<LocationModel> parseLocation(
      List<CameraPositionModel> locationModelList) {
    final positionList = <LocationModel>[];
    for (var i = 1; i < locationModelList.length; i++) {
      positionList.add(LocationMapper.mapper(locationModelList[i]));
    }
    return positionList;
  }

  @override
  Future<List<CameraPositionModel>> readXLSX() async {
    try {
      ByteData data = await rootBundle.load('assets/xlsx/GPX_cam_bA.xlsx');
      final isolate = Isolate.run<List<CameraPositionModel>>(
        () {
          var bytes =
              data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
          var excel = Excel.decodeBytes(bytes);
          final cameraPositionList = <CameraPositionModel>[];

          for (var table in excel.tables.keys) {
            for (var row in excel.tables[table]!.rows) {
              var longitude = row[0]!.value;
              var latitude = row[1]!.value;

              var speedLimit = row[8]!.value;

              final positionModel = CameraPositionModel(
                  longitude: longitude.toString(),
                  latitude: latitude.toString(),
                  speedLimit: speedLimit.toString());

              cameraPositionList.add(positionModel);

              print(positionModel.toString());
            }
          }

          return cameraPositionList;
        },
      );

      return isolate;
    } on Object catch (err, stack) {
      Error.throwWithStackTrace(err, stack);
    }
  }

  Future<List<CameraPositionModel>> readExcelTable() async {
    try {
      ByteData data = await rootBundle.load('assets/xlsx/GPX_cam_bA.xlsx');
      var bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      var excel = Excel.decodeBytes(bytes);
      final isolate = Isolate.run<List<CameraPositionModel>>(() {
        final cameraPositionList = <CameraPositionModel>[];

        for (var table in excel.tables.keys) {
          for (var row in excel.tables[table]!.rows) {
            var latitude = row[1];
            var longitude = row[0];

            var speedLimit = row[8];

            cameraPositionList.add(CameraPositionModel(
                longitude: longitude!.value.toString(),
                latitude: latitude!.value.toString(),
                speedLimit: speedLimit!.value.toString()));
          
          }
        }

        return cameraPositionList;
      });

      isolate.onError((error, stackTrace) {
        logger.e('message', error: error, stackTrace: stackTrace);
        return [];
      });

      return await isolate;
    } on Object catch (err, stack) {
      logger.e('', error: err, stackTrace: stack);
      Error.throwWithStackTrace(err, stack);
    }
  }
}
