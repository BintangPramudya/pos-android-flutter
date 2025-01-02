import 'package:dewakoding_kasir/app/data/source/setting_api_service.dart';
import 'package:dewakoding_kasir/app/domain/entity/setting.dart';
import 'package:dewakoding_kasir/app/domain/repository/setting_repository.dart';
import 'package:dewakoding_kasir/core/network/data_state.dart';

class SettingRepositoryImpl extends SettingRepository {
  final SettingApiService _settingApiService;

  SettingRepositoryImpl(this._settingApiService);
  @override
  Future<DataState<SettingEntity>> get() {
    return handleResponse(
        () => _settingApiService.get(), (json) => SettingEntity.fromJson(json));
  }
}
