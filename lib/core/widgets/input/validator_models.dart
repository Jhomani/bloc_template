enum FieldFormat {
  email,
  number,
  phone,
  cif,
}

enum ValidateKey {
  regex,
  required,
  email,
  phone,
  cif,
  min,
  max,
  equalTo,
}

class Validator {
  RegExp? regex;
  bool? required;
  int? min;
  String? equalTo;
  int? max;
  FieldFormat? format;

  Map<ValidateKey, String>? message;

  Validator({
    this.required,
    this.regex,
    this.message,
    this.format,
    this.equalTo,
    this.min,
    this.max
  });
}
