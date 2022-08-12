class API {
  static const String baseUrl = 'https://bank-statement-bff.herokuapp.com';
  static const Map<String, String> defaultHeaders = {
    'token':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c'
  };

  static String balance = '$baseUrl/myBalance';

  static String statement(String limit, String offset) =>
      '$baseUrl/myStatement/$limit/$offset';

  static String detail(String id) => '$baseUrl/myStatement/detail/$id';
}
