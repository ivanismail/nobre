class ApiStatusString {
  static String get fail => 'fail';
  static String get success => 'success';
  static String get error => 'error';
  static String get timeout => 'timeout';
  static String get unauthorized => 'Unauthenticate';
  static String get requestdeny => 'REQUEST_DENIED';
  static String get notfound => 'NOT_FOUND';
  static String get invalid => 'INVALID_REQUEST';
  static String get errorvalidation => 'error validation';
  static String get inertnalServer => 'internal_server';
  static String get serverBusy => 'server_busy';
}

enum ApiStatus {
  fail,
  success,
  error,
  timeout,
  unauthorized,
  requestdeny,
  notfound,
  invalid,
  errorvalidation,
  found,
  serverBusy,
  internalServer,
}
