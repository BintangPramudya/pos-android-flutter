import 'dart:collection';

import 'package:dewakoding_kasir/app/domain/entity/order.dart';
import 'package:dewakoding_kasir/app/domain/entity/product.dart';
import 'package:dewakoding_kasir/app/domain/usecase/product_get_by_barcode.dart';
import 'package:dewakoding_kasir/core/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputOrderNotifier extends AppProvider {
  final ProductGetByBarcodeUseCase _productGetByBarcodeUseCase;
  InputOrderNotifier(this._productGetByBarcodeUseCase) {
    init();
  }

  static const String NAME = 'NAME';
  static const String GENDER = 'GENDER';

  bool _isShowCustomer = true;
  HashMap<String, String> _errorCustomer = HashMap();
  List<ProductItemOrderEntity> _listOrderItem = [];
  final List<DropdownMenuEntry<String>> _genderListDropdown = [
    DropdownMenuEntry<String>(value: 'male', label: 'Laki-laki'),
    DropdownMenuEntry<String>(value: 'female', label: 'Perempuan')
  ];

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _notesController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _birthdayController = TextEditingController();

  bool get isShowCustomer => _isShowCustomer;
  HashMap<String, String> get errorCustomer => _errorCustomer;
  List<ProductItemOrderEntity> get listOrderItem => _listOrderItem;
  List<DropdownMenuEntry<String>> get genderListDropdown => _genderListDropdown;

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get genderController => _genderController;
  TextEditingController get notesController => _notesController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get birthdayController => _birthdayController;

  OrderEntity get order {
    final genderValue = (_genderController.text.isNotEmpty)
        ? _genderListDropdown
            .where(
              (element) => element.label == _genderController.text,
            )
            .first
            .value
        : '';
    return OrderEntity(
        name: _nameController.text,
        gender: genderValue,
        email: _emailController.text,
        phone: _phoneController.text,
        birthday: _birthdayController.text,
        notes: _notesController.text,
        items: _listOrderItem);
  }

  set isShowCustomer(bool param) => _isShowCustomer = param;

  @override
  init() {}

  validateCustomer() {
    showLoading();
    _errorCustomer.clear();
    if (_nameController.text.isEmpty)
      _errorCustomer[NAME] = 'Nama harus terisi';
    if (_genderController.text.isEmpty)
      _errorCustomer[GENDER] = 'Gender harus terisi';
    hideLoading();
  }

  updateItems(List<ProductItemOrderEntity> param) {
    _listOrderItem.clear();
    _listOrderItem.addAll(param);
    notifyListeners();
  }

  updateQuantity(ProductItemOrderEntity item, int newQuantity) {
    final index = _listOrderItem.indexOf(item);
    if (newQuantity == 0) {
      _listOrderItem.removeAt(index);
    } else {
      _listOrderItem[index] =
          _listOrderItem[index].copyWith(quantity: newQuantity);
    }
    notifyListeners();
  }

  scan(String barcodeText) async {
    _getProductByBarcode(barcodeText);
  }

  _getProductByBarcode(String param) async {
    showLoading();
    final respone = await _productGetByBarcodeUseCase(param: param);
    if (respone.success) {
      final product = respone.data!;
      final index = _listOrderItem.indexWhere(
        (element) => element.id == product.id,
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
        if (product.stock > 0) {
          _listOrderItem.add(ProductItemOrderEntity(
              id: product.id,
              name: product.name,
              quantity: 1,
              price: product.price,
              barcode: product.barcode,
              stock: product.stock));
        } else {
          snackBarMessage =
              'Stok produk ${product.name} (#${product.barcode}) kosong';
        }
      }
    } else {
      snackBarMessage = respone.message;
    }
    hideLoading();
  }
}
