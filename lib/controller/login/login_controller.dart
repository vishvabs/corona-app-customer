import 'package:bloc/bloc.dart';
import 'package:CT_Covid/api/api_auth_repository.dart';
import 'package:CT_Covid/injector/injector.dart';
import 'package:CT_Covid/model/login/login_body.dart';
import 'package:CT_Covid/model/token/token.dart';
import 'package:CT_Covid/storage/sharedpreferences/shared_preferences_manager.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String error;
  LoginFailure(this.error);
}

class LoginSuccess extends LoginState {}

class LoginEvent extends LoginState {
  final LoginBody loginBody;

  LoginEvent(this.loginBody);
}

class LoginController extends Bloc<LoginEvent, LoginState> {
  final ApiAuthRepository apiAuthRepository = ApiAuthRepository();
  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    // TODO: implement mapEventToState
    LoginBody loginBody = event.loginBody;
    if (loginBody.username == null || loginBody.username.isEmpty) {
      yield LoginFailure("Username is required");
      return;
    } else if (loginBody.password == null || loginBody.password.isEmpty) {
      yield LoginFailure("Password is required");
      return;
    }

    yield LoginLoading();
    Token token = await apiAuthRepository.postLoginUser(loginBody);
    if (token.error != null) {
      yield LoginFailure(token.error);
      return;
    }
    await sharedPreferencesManager.putString(
        SharedPreferencesManager.keyAccessToken, token.accessToken);
    await sharedPreferencesManager.putString(
        SharedPreferencesManager.keyRefreshToken, token.refreshToken);
    await sharedPreferencesManager.putBool(
        SharedPreferencesManager.keyIsLogin, true);
    await sharedPreferencesManager.putString(
        SharedPreferencesManager.keyUsername, loginBody.username);
    yield LoginSuccess();
  }
}
