import 'package:dewakoding_kasir/app/domain/entity/auth.dart';
import 'package:dewakoding_kasir/core/network/data_state.dart';

abstract class AuthRepository {
  Future<DataState> login(AuthEntity param);
}
