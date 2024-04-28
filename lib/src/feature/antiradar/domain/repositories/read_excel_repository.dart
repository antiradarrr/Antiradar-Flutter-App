import 'package:antiradar/src/feature/antiradar/data/model/camera_position_model.dart';
import 'package:antiradar/src/feature/antiradar/data/model/location_model.dart';

/// {@template read_excel_repository}
/// IReadExcelRepository.
/// {@endtemplate}
abstract interface class IReadExcelRepository {
  /// {@macro read_excel_repository}

  Future<List<CameraPositionModel>> readXLSX();
  List<LocationModel> parseLocation(
      List<CameraPositionModel> locationModelList);
}
