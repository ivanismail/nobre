class ErrorValidationResModel {
  Map<String, dynamic>? errors;

  ErrorValidationResModel({this.errors});

  ErrorValidationResModel.fromJson(Map<String, dynamic> json) {
    errors = json['errors'] != null ? json['errors'] : null;
  }
}
