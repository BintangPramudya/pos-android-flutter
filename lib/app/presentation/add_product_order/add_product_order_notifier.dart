import 'package:dewakoding_kasir/app/domain/entity/product.dart';
import 'package:dewakoding_kasir/app/domain/usecase/product_get_all.dart';
import 'package:dewakoding_kasir/core/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddProductOrderNotifier extends AppProvider {
  final ProductGetAllUseCase _productGetAllUseCase;
  final List<ProductItemOrderEntity> _listOrderOld;

  AddProductOrderNotifier(this._listOrderOld, this._productGetAllUseCase) {
    init();
  }

  TextEditingController _searchController = TextEditingController();

  List<ProductItemOrderEntity> _listOrderItem = [];

  TextEditingController get searchController => _searchController;

  List<ProductItemOrderEntity> get listOrderItem {
    if (_searchController.text.isEmpty)
      return _listOrderItem;
    else {
      return _listOrderItem
          .where((element) =>
              element.name
                  .toUpperCase()
                  .contains(_searchController.text.toUpperCase()) ||
              (element.barcode
                      ?.toUpperCase()
                      .contains(_searchController.text.toUpperCase()) ??
                  false))
          .toList();
    }
  }

  List<ProductItemOrderEntity> get listOrderItemFilteredQuantity {
    return _listOrderItem
        .where(
          (element) => element.quantity > 0,
        )
        .toList();
  }

  int get totalProduct {
    int totalTemp = 0;
    _listOrderItem.forEach(
      (element) => totalTemp += element.quantity,
    );
    return totalTemp;
  }

  @override
  init() {
    _getProduct();
  }

  _getProduct() async {
    showLoading();
    final response = await _productGetAllUseCase();
    if (response.success) {
      final listProductActive = response.data!
          .where(
            (element) => element.isActive,
          )
          .toList();
      _listOrderItem =
          List<ProductItemOrderEntity>.from(listProductActive.map((item) {
        final int index = _listOrderOld.indexWhere(
          (element) => element.id == item.id,
        );
        return ProductItemOrderEntity(
            id: item.id,
            name: item.name,
            quantity: (index > -1) ? _listOrderOld[index].quantity : 0,
            price: item.price,
            barcode: item.barcode,
            stock: item.stock);
      }));
    } else {
      errorMessage = response.message;
    }
    hideLoading();
  }

  submitSearch() {
    notifyListeners();
  }

  clearSearch() {
    _searchController.text = '';
    notifyListeners();
  }

  updateQuantity(ProductItemOrderEntity item, int newQuantity) {
    final index = _listOrderItem.indexOf(item);
    if (newQuantity >= 0) {
      _listOrderItem[index] =
          _listOrderItem[index].copyWith(quantity: newQuantity);
    }
    notifyListeners();
  }

  scan(String barcodeText) async {
    _searchController.text = barcodeText;
    _updateQuantityFromBarcode(barcodeText);
    notifyListeners();
  }

  _updateQuantityFromBarcode(String param) {
    final index = _listOrderItem.indexWhere(
      (element) => element.barcode == param,
    );
    if (index >= 0) {
      final item = _listOrderItem[index];
      if (item.stock != null &&
          item.stock! > 0 &&
          item.stock! > item.quantity) {
        _listOrderItem[index] = item.copyWith(quantity: item.quantity + 1);
      } else {
        snackBarMessage =
            'Stok produk ${item.name} (#${item.barcode}) tidak mencukupi';
      }
    } else {
      snackBarMessage = 'Produk (#${param}) tidak ditemukan';
    }
    notifyListeners();
  }
}
