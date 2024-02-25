class UserToken {
  late String _token;

  String get token => _token;

  set(String token) {
    _token = token;
    
  }

  static final UserToken _instance = UserToken();
  static UserToken get instance => _instance;
  
}
