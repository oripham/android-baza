class Account {
  String _fullName = '';
  String _email = '';
  String _password = '';
  String _phoneNumber = '';
  String _token = '';

  Account({
    required String fullName,
    required String email,
    required String password,
    required String phoneNumber,
    required String token,
  }) {
    _fullName = fullName;
    _email = email;
    _password = password;
    _phoneNumber = phoneNumber;
    _token = token;
  }

  // Getters
  String get fullName => _fullName;
  String get email => _email;
  String get phoneNumber => _phoneNumber;
  String get token => _token;

  // Setters
  set fullName(String value) {
    _fullName = value;
  }

  set email(String value) {
    _email = value;
  }

  set password(String value) {
    _password = value;
  }

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  set token(String value) {
    _token = value;
  }
}