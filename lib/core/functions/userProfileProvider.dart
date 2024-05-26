import 'package:flutter/material.dart';
import 'package:reminder_app/models/user_model.dart';

class UserProfileProvider extends ChangeNotifier {
  UserProfileProvider(this._userProfile);

  UserModel? _userProfile;

  UserModel? get userProfile => _userProfile;

  void updateUserProfile(UserModel newProfile) {
    _userProfile = newProfile;
    notifyListeners();
  }
}