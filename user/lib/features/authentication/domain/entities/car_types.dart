abstract class CarTypes {
  final String message;
  final Results results;

  CarTypes({
    required this.message,
    required this.results,
  });
}

abstract class Results {
  final List<Car> cars;

  Results({
    required this.cars,
  });
}

abstract class Car {
  final String logo;
  final String type;
  final List<Brand> brands;
  final String id;

  Car({
    required this.logo,
    required this.type,
    required this.brands,
    required this.id,
  });
}

abstract class Brand {
  final String brandName;
  final List<String> models;

  Brand({
    required this.brandName,
    required this.models,
  });
}
