class Unauthorized implements Exception {
  String message;

  Unauthorized(this.message);
}

class InternalError implements Exception {
  String message;

  InternalError(this.message);
}
