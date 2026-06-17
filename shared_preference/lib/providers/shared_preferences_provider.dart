import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Khai báo 1 provider mới
// tên là sharedPreferencesProvider
// Provider này sẽ cung cấp "instance" liên quan SharedPreferences cho cả app

// Riverpod -> 1) annotation 2) part

part 'shared_preferences_provider.g.dart';

// Tạm thời ta chủ động throw 1 exception,
// vì sẽ set lại value (override) cho provider này lúc run dự án

@riverpod
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError();
}
