class Unauthorized implements Exception {
  String message;

  Unauthorized(this.message);
}

class EntityNotFound implements Exception {
  String message;

  EntityNotFound(this.message);
}

class NoConnection implements Exception {
  String message;

  NoConnection(this.message);
}


class InternalError implements Exception {
  String message;

  InternalError(this.message);
}