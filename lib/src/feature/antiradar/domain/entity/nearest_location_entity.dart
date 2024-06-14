class NearestLocationEntity {
  NearestLocationEntity(this.speedLimit, this.distanceInMeters);

  final double distanceInMeters;
  final int speedLimit;

  NearestLocationEntity.empty()
      : speedLimit = 0,
        distanceInMeters = 0;

  NearestLocationEntity.getPost(double distance)
      : distanceInMeters = distance,
        speedLimit = 0;

  NearestLocationEntity.mock()
      : distanceInMeters = 493,
        speedLimit = 120;
}
