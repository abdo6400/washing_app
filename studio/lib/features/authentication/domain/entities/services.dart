abstract class Services {
    final String message;
    final Results results;

    Services({
        required this.message,
        required this.results,
    });

}

abstract class Results {
    final List<Service> services;

    Results({
        required this.services,
    });

}

abstract class Service {
    final String type;
    final String id;

    Service({
        required this.type,
        required this.id,
    });

}
