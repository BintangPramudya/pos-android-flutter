import 'package:dewakoding_kasir/app/domain/entity/order.dart';
import 'package:dewakoding_kasir/app/domain/entity/payment_method.dart';
import 'package:dewakoding_kasir/app/domain/usecase/order_send.dart';
import 'package:dewakoding_kasir/app/domain/usecase/payment_method_get_all.dart';
import 'package:dewakoding_kasir/core/provider/app_provider.dart';
import 'package:flutter/material.dart';

class CheckoutNotifier extends AppProvider {
  OrderEntity _order;
  final PaymentMethodGetAllUseCase _paymentMethodGetAllUseCase;
  final OrderSendUseCase _orderSendUseCase;

  CheckoutNotifier(
      this._order, this._paymentMethodGetAllUseCase, this._orderSendUseCase) {
    init();
  }

  static const String MALE = 'male';
  static const String FEMALE = 'female';

  bool _isSuccess = false;

  List<DropdownMenuEntry<int>> _listDropdownPaymentMethod = [];
  int _initialPaymentMethod = -1;

  TextEditingController _totalController = TextEditingController();

  TextEditingController _methodController = TextEditingController();

  TextEditingController _amountController = TextEditingController();

  TextEditingController _changeController = TextEditingController();

  OrderEntity get order => _order;

  bool get isSuccess => _isSuccess;

  List<DropdownMenuEntry<int>> get listDropdownPaymentMethod =>
      _listDropdownPaymentMethod;
  int get initialPaymentMethod => _initialPaymentMethod;

  TextEditingController get totalController => _totalController;

  TextEditingController get methodController => _methodController;

  TextEditingController get amountController => _amountController;

  TextEditingController get changeController => _changeController;

  @override
  init() async {
    await _getPaymentMethod();
    await _updateValuePayment();
  }

  _getPaymentMethod() async {
    showLoading();
    final response = await _paymentMethodGetAllUseCase();
    if (response.success) {
      _listDropdownPaymentMethod = List<DropdownMenuEntry<int>>.from(
              response.data!.map((item) =>
                  DropdownMenuEntry<int>(value: item.id, label: item.name)))
          .toList();
      _initialPaymentMethod = response.data!.first.id;
    } else {
      errorMessage = response.message;
    }

    hideLoading();
  }

  _updateValuePayment() {
    int tempTotal = 0;
    _order.items.forEach(
      (element) => tempTotal += element.quantity * element.price,
    );
    _totalController.text = tempTotal.toString();
    _amountController.text = '0';
    updateChangeAmount();
  }

  updateChangeAmount() {
    _changeController.text =
        (int.parse(_amountController.text) - int.parse(_totalController.text))
            .toString();
    notifyListeners();
  }

  send() async {
    showLoading();
    if (_amountController.text.isEmpty)
      snackBarMessage = 'Nominal bayar harus diisi';
    else {
      final int paymentMethodValue = (_methodController.text.isNotEmpty)
          ? _listDropdownPaymentMethod
              .where(
                (element) => element.label == _methodController.text,
              )
              .first
              .value
          : 0;
      _order = _order.copyWith(
          totalPrice: int.parse(_totalController.text),
          paymentMethodId: paymentMethodValue,
          paidAmount: int.parse(_amountController.text),
          changeAmount: int.parse(_changeController.text));
      final response = await _orderSendUseCase(param: _order);
      if (response.success) {
        _order = _order.copyWith(id: response.data);
        _isSuccess = true;
      } else {
        snackBarMessage = response.message;
      }
    }
    hideLoading();
  }
}
