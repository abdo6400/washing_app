abstract class Studio {
  final List<double> location;
  final String logo;
  final String name;
  final String phone;
  final String description;
  final String openTime;
  final String closeTime;
  final List<Service> services;
  final List<String> studioImages;
  final double ratingsAvg;
  final String id;

  Studio({
    required this.location,
    required this.logo,
    required this.name,
    required this.phone,
    required this.description,
    required this.openTime,
    required this.closeTime,
    required this.services,
    required this.studioImages,
    required this.ratingsAvg,
    required this.id,
  });
}

abstract class Service {
  final String type;
  final String logo;
  final String id;
  final String price;

  Service( {
    required this.type,
    required this.logo,
    required this.id,required this.price,
  });
}
