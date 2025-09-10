import '../model/models.dart';

class UserSession {
  static UserSession? _instance;
  static UserSession get instance => _instance ??= UserSession._internal();
  UserSession._internal();

  Customer? _currentUser;
  bool _isLoggedIn = false;

  // Getters
  Customer? get currentUser => _currentUser;
  bool get isLoggedIn => _isLoggedIn;

  // Login - เก็บข้อมูล user
  void login(Customer user) {
    _currentUser = user;
    _isLoggedIn = true;
    print('User logged in: ${user.fullname} (ID: ${user.idx})');
  }

  // Logout - ลบข้อมูล user
  void logout() {
    _currentUser = null;
    _isLoggedIn = false;
    print('User logged out');
  }

  // Get user info
  String get userName => _currentUser?.fullname ?? 'Guest';
  String get userEmail => _currentUser?.email ?? '';
  String get userPhone => _currentUser?.phone ?? '';
  int get userId => _currentUser?.idx ?? 0;
  String get userImage => _currentUser?.image ?? '';

  // Check if user is logged in
  bool get hasValidSession => _isLoggedIn && _currentUser != null;
}
