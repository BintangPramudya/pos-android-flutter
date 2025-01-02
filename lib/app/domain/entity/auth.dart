import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.g.dart';
part 'auth.freezed.dart';

@freezed
sealed class Auth with _$Auth {
  const factory Auth.entity({required String email, required String password}) =
      AuthEntity;

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}
