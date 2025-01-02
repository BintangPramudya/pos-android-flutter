import 'package:dewakoding_kasir/app/domain/entity/product.dart';
import 'package:dewakoding_kasir/app/domain/repository/product_repository.dart';
import 'package:dewakoding_kasir/core/network/data_state.dart';
import 'package:dewakoding_kasir/core/use_case/app_use_case.dart';

class ProductGetAllUseCase
    extends AppUseCase<Future<DataState<List<ProductEntity>>>, void> {
  final ProductRepository _productRepository;

  ProductGetAllUseCase(this._productRepository);

  @override
  Future<DataState<List<ProductEntity>>> call({void param}) {
    return _productRepository.getAll();
  }
}
