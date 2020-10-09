class MangoNetworkException implements Exception {
  final Exception exception;

  MangoNetworkException(this.exception);

  @override
  String toString() =>
      'MangoNetworkException(exception: ${exception.toString()})';
}
