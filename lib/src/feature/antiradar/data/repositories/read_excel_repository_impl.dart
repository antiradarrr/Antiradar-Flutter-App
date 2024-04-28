import 'package:antiradar/src/feature/antiradar/data/data_souces/read_excel_data_sources.dart.dart';
import 'package:antiradar/src/feature/antiradar/data/model/camera_position_model.dart';
import 'package:antiradar/src/feature/antiradar/data/model/location_model.dart';
import 'package:antiradar/src/feature/antiradar/domain/repositories/read_excel_repository.dart';

/// {@template read_excel_repository_impl}
/// ReadExcelRepositoryImpl.
/// {@endtemplate}
base class ReadExcelRepositoryImpl implements IReadExcelRepository {
  /// {@macro read_excel_repository_impl}
  ReadExcelRepositoryImpl({required this.readExcelDataSources});

  final IReadExcelDataSources readExcelDataSources;

  @override
  List<LocationModel> parseLocation(
      List<CameraPositionModel> locationModelList) {
    return readExcelDataSources.parseLocation(locationModelList);
  }

  @override
  Future<List<CameraPositionModel>> readXLSX() async {
    return await readExcelDataSources.readXLSX();
  }
}
