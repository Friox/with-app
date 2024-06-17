import 'package:app/models/auth_data_model.dart';
import 'package:app/models/user_profile_model.dart';
import 'package:app/providers/notifiers/mission_notifier.dart';
import 'package:app/providers/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthState {
  final bool isLoading;
  final String? errorMessage;
  final AuthDataModel? authData;
  final UserProfileModel? userProfile;

  AuthState({
    this.isLoading = false,
    this.errorMessage,
    this.authData,
    this.userProfile,
  });

  AuthState copyWith({
    bool? isLoading,
    String? errorMessage,
    AuthDataModel? authData,
    UserProfileModel? userProfile,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      authData: authData ?? this.authData,
      userProfile: userProfile ?? this.userProfile,
    );
  }

  bool get isValid {
    // 로그인 유효성 검증
    // print(authData);
    return authData != null && authData!.token != null;
  }

  bool get isUserProfileValid {
    return userProfile != null;
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;
  final FlutterSecureStorage _secureStorage;
  
  final Ref _ref;

  static const String _tokenKey = 'access_token';

  AuthNotifier(this._authRepository, this._secureStorage, this._ref) : super(AuthState());

  Future<bool> login(String id, String pw) async {
    state = state.copyWith(isLoading: true);
    try {
      final authData = await _authRepository.signIn(id, pw);
      state = state.copyWith(authData: authData, isLoading: false);
      if (state.isValid) {
        _ref.invalidate(missionInboundListProvider);
        await getUserProfile(state.authData!.token);
      }
      return true;
    } catch (e) {
      state = state.copyWith(
        errorMessage: 'error: $e',
        isLoading: false,
      );
      return false;
    }
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: _tokenKey);
  }

  Future<bool> hasToken() async {
    final token = await _secureStorage.read(key: _tokenKey);
    return token != null;
  }

  bool get isLoggedIn => state.isValid;

  Future<bool> logout() async {
    try {
      await _secureStorage.delete(key: _tokenKey);
      state = AuthState();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<UserProfileModel?> getUserProfile(String? token) async {
    try {
      final userData = await _authRepository.getUserProfile(token);
      state = state.copyWith(userProfile: userData);
      return userData;
    } catch (e) {
      return null;
    }
  }
}

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(
    AuthRepository(),
    const FlutterSecureStorage(),
    ref
  ),
);