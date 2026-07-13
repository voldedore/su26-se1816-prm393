import 'package:auth_demo/service/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/token_service.dart';

part 'providers.g.dart';

// Cung cap instance cua SPref ~ Repo
@riverpod
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError();
}

// Token Service Provider = provider cho token service
final tokenServiceProvider = Provider<TokenService>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return TokenService(prefs);
});

// Auth Service Provider
final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});