import 'dart:async';
import 'dart:isolate';

import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:antiradar/src/feature/antiradar/domain/entity/camera_location_entity.dart';

abstract interface class ICameraLocalDataSources {
  Future<List<CameraLocationEntity>> fetchCameraList();
}

base class CameraLocalDataSources implements ICameraLocalDataSources {
  @override
  Future<List<CameraLocationEntity>> fetchCameraList() async {
    try {
      ByteData data = await rootBundle.load('assets/xlsx/GPX_cam_bA.xlsx');

      final isolate = Isolate.run<List<CameraLocationEntity>>(() {
        var bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        var excel = Excel.decodeBytes(bytes);
        final locationModelList = <CameraLocationEntity>[];

        for (var table in excel.tables.keys) {
          /// Skip the first element it returns the table name.
          for (var row in excel.tables[table]!.rows.skip(1)) {
            var longitude = double.parse(row[0]!.value.toString());
            var latitude = double.parse(row[1]!.value.toString());
            // var speedLimit = row[8]!.value as;

            final locationModel = CameraLocationEntity(
              latitude: latitude,
              longitude: longitude,
              speedLimit: 0,
            );

            locationModelList.add(locationModel);
          }
        }

        return locationModelList;
      });
      return await isolate;
    } on Object catch (error, stack) {
      Error.throwWithStackTrace(error, stack);
    }
  }
}
