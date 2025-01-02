import 'package:bintang_kasir/app/domain/entity/product.dart';
import 'package:bintang_kasir/core/network/data_state.dart';

abstract class ProductRepository {
  Future<DataState<List<ProductEntity>>> getAll();
  Future<DataState<ProductEntity>> getByBarcode(String param);
}
