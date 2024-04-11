import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure({required super.errorMessage});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.errorMessage});
}

class LocationFailure extends Failure {
  const LocationFailure({required super.errorMessage});
}
