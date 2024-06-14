import 'package:antiradar/src/feature/antiradar/domain/entity/location_entity.dart';

base class PostEntity extends LocationEntity {
  PostEntity({required super.longitude, required super.latitude});

  PostEntity.empty() : super(longitude: 0, latitude: 0);
}
