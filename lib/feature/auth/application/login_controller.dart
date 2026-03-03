import 'package:experimentlogin/core/api/api_service.dart';
import 'package:experimentlogin/feature/auth/data/login_state.dart';
import 'package:hooks_riverpod/legacy.dart';

import '../../../core/api/api_serviceProvider.dart';
import '../data/model/auth_model.dart';

class LoginController  extends StateNotifier<LoginState>{
  ApiService api;
  LoginController(this.api):super(LoginState());
  Future<void> login(String user, String password) async {


    try {
      final response=await api.post(
        'login',
        body: {
          'username': user,
          'password': password,
        },
      );
      final auth =AuthModel.fromJson(response);


      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
        auth: auth
      );


    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}
final loginProvider = StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController(ref.read(apiServiceProvider));
});