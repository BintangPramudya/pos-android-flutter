import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting.g.dart';
part 'setting.freezed.dart';

@freezed
sealed class Setting with _$Setting {
  const factory Setting.entity({String? shop, String? address, String? phone}) =
      SettingEntity;
  factory Setting.fromJson(Map<String, dynamic> json) =>
      _$SettingFromJson(json);
}
