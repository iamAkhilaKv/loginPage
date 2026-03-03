import 'model/auth_model.dart';

class LoginState {
  final bool isLoading;
  final String? error;
  final bool isSuccess;
  final AuthModel? auth;

  LoginState({
    this.isLoading = false,
    this.error,
    this.isSuccess = false,
    this.auth
  });

  LoginState copyWith({
    bool? isLoading,
    String? error,
    bool? isSuccess,
    AuthModel? auth
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isSuccess: isSuccess ?? this.isSuccess,
      auth: auth ?? this.auth
    );
  }
}
