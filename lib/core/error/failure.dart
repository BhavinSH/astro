abstract class Failure {
  final String? message;

  Failure({this.message});
}

// General failures
class ServerFailure extends Failure {
  ServerFailure({
    String? message,
  }) : super(message: message);
}

class CacheFailure extends Failure {
  CacheFailure({
    String? message,
  }) : super(message: message);
}

class PlatformChannelFailure extends Failure {
  PlatformChannelFailure({
    String? message,
  }) : super(message: message);
}

class NetworkConnectionFailure extends Failure {
  NetworkConnectionFailure({
    String? message,
  }) : super(message: message);
}

String mapFailureToMessage(Failure? failure) {
  if (failure != null) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return failure.message ?? 'Server Failure, Please Try Again!';
      case NetworkConnectionFailure:
        return 'No Internet Connection, check your connection and try again';
      default:
        return 'Unexpected Error';
    }
  } else {
    return 'Unexpected Error';
  }
}
