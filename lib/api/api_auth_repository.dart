import 'package:CT_Covid/api/api_auth_provider.dart';
import 'package:CT_Covid/model/diagnostic/diagnostic.dart';
import 'package:CT_Covid/model/login/login_body.dart';
import 'package:CT_Covid/model/refreshtoken/refresh_token_body.dart';
import 'package:CT_Covid/model/register/register.dart';
import 'package:CT_Covid/model/token/token.dart';
import 'package:CT_Covid/model/user/user.dart';

class ApiAuthRepository {
  ApiAuthProvider _apiAuthProvider = ApiAuthProvider();

  Future<Diagnostic> postRegisterUser(Register register) =>
      _apiAuthProvider.registerUser(register);

  Future<Token> postLoginUser(LoginBody loginBody) =>
      _apiAuthProvider.loginUser(loginBody);

  Future<Token> postRefreshAuth(RefreshTokenBody refreshTokenBody) =>
      _apiAuthProvider.refreshAuth(refreshTokenBody);

  Future<User> fetchAllUsers() => _apiAuthProvider.getAllUsers();
}
