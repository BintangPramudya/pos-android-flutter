import 'package:dewakoding_kasir/app/domain/entity/product.dart';
import 'package:dewakoding_kasir/app/domain/repository/product_repository.dart';
import 'package:dewakoding_kasir/core/network/data_state.dart';
import 'package:dewakoding_kasir/core/use_case/app_use_case.dart';

class ProductGetByBarcodeUseCase
    extends AppUseCase<Future<DataState<ProductEntity>>, String> {
  final ProductRepository _productRepository;

  ProductGetByBarcodeUseCase(this._productRepository);
  @override
  Future<DataState<ProductEntity>> call({String? param}) {
    return _productRepository.getByBarcode(param!);
  }
}
