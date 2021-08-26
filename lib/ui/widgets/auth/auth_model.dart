import 'package:first_big_app/domains/api_client/api_client.dart';
import 'package:first_big_app/domains/data_providers/session_data_provider.dart';
import 'package:first_big_app/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _sessionDataProvider = SessionDataProvider();
  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;
  bool get isAuthInProgress => !_isAuthProgress;

  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;
    if (login.isEmpty || password.isEmpty) {
      _errorMessage = 'Заполните логин и пароль';
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();
    String? sessionId;
    try{
       sessionId = await _apiClient.auth(
          userName: login,
          password: password);
    } catch(e){
        _errorMessage = 'Неправильные логин или пароль';
    }
    _isAuthProgress = false;
    if(_errorMessage != null){
      notifyListeners();
      return;
    }
    if(sessionId == null) {
      _errorMessage ="Неизвестная ошибка";
      notifyListeners();
      return;
    }
   await _sessionDataProvider.setSessionId(sessionId);
    Navigator.of(context).pushReplacementNamed(MainNavigationRouteNames.main);
  }
}


