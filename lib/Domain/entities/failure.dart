class Failures{
  String errMsg;
  Failures({required this.errMsg});
}
class ServerFailure extends Failures{
  ServerFailure({required super.errMsg});
}
class NetworkFailure extends Failures{
  NetworkFailure({required super.errMsg});
}