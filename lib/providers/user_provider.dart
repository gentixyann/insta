import 'package:flutter/widgets.dart';
import 'package:insta/models/user.dart';
import 'package:insta/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    print('refreshUserへ');
    User user = await _authMethods.getUserDetails();
    _user = user;
    print(user.email);
    print(user.uid);
    notifyListeners();
  }
}
