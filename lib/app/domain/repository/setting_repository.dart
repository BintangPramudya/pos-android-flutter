import 'package:bintang_kasir/app/domain/entity/setting.dart';
import 'package:bintang_kasir/core/network/data_state.dart';

abstract class SettingRepository {
  Future<DataState<SettingEntity>> get();
}
