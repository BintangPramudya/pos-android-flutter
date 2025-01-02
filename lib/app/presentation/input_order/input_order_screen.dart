import 'package:dewakoding_kasir/app/domain/entity/product.dart';
import 'package:dewakoding_kasir/app/presentation/add_product_order/add_product_order_screen.dart';
import 'package:dewakoding_kasir/app/presentation/checkout/checkout_screen.dart';
import 'package:dewakoding_kasir/app/presentation/input_order/input_order_notifier.dart';
import 'package:dewakoding_kasir/core/helper/date_time_helper.dart';
import 'package:dewakoding_kasir/core/helper/dialog_helper.dart';
import 'package:dewakoding_kasir/core/helper/global_helper.dart';
import 'package:dewakoding_kasir/core/helper/number_helper.dart';
import 'package:dewakoding_kasir/core/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

class InputOrderScreen extends AppWidget<InputOrderNotifier, void, void> {
  
  @override
  AppBar? appBarBuild(BuildContext context) {
    return AppBar(
      title: const Text('Create Order'),
      actions: [
        IconButton(
          onPressed: () => _showDialogCustomer(context),
          icon: const Icon(Icons.person_outline),
        )
      ],
    );
  }

  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Produk Dipesan',
                    style: GlobalHelper.getTextTheme(context,
                            appTextStyle: AppTextStyle.TITLE_LARGE)
                        ?.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => _onPressBarcode(context),
                  icon: const Icon(Icons.qr_code_scanner),
                  tooltip: 'Scan Barcode',
                ),
                IconButton(
                  onPressed: () => _onPressAddProduct(context),
                  icon: const Icon(Icons.add),
                  tooltip: 'Tambah Produk',
                ),
              ],
            ),
            const SizedBox(height: 16),
            notifier.listOrderItem.isNotEmpty
                ? ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: notifier.listOrderItem.length,
                    itemBuilder: (context, index) {
                      final item = notifier.listOrderItem[index];
                      return _itemOrderLayout(context, item);
                    },
                  )
                : Center(
                    child: Text(
                      'Belum ada produk yang dipesan',
                      style: GlobalHelper.getTextTheme(context,
                          appTextStyle: AppTextStyle.BODY_MEDIUM),
                    ),
                  ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _onPressCheckout(context),
                icon: const Icon(
                  Icons.shopping_cart_checkout,
                  color:
                      Colors.white, // Ubah warna ikon di sini jika diperlukan
                ),
                label: const Text(
                  'Checkout',
                  style:
                      TextStyle(color: Colors.white), // Ubah warna teks di sini
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white, // Mengatur warna teks dan ikon
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _itemOrderLayout(BuildContext context, ProductItemOrderEntity item) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white, // Set background color to white
      border: Border.all(
        color: GlobalHelper.getColorScheme(context).outline,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 6,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                item.name,
                style: GlobalHelper.getTextTheme(context,
                        appTextStyle: AppTextStyle.LABEL_LARGE)
                    ?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                overflow: TextOverflow.ellipsis, // Handles long text
              ),
            ),
            Text(
              NumberHelper.formatIdr(item.price),
              style: GlobalHelper.getTextTheme(context,
                      appTextStyle: AppTextStyle.BODY_LARGE)
                  ?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: GlobalHelper.getColorScheme(context).primary),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Stok: ${item.stock}',
              style: GlobalHelper.getTextTheme(context,
                  appTextStyle: AppTextStyle.BODY_MEDIUM)
                  ?.copyWith(
                    color: Colors.grey[700],
                  ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () => _onPressRemoveQuantity(item),
                  icon: Icon(
                    Icons.remove_circle_outline,
                    color: Colors.redAccent,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: GlobalHelper.getColorScheme(context).outline,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.grey[100], // Light gray background
                  ),
                  child: Text(
                    item.quantity.toString(),
                    style: GlobalHelper.getTextTheme(context,
                        appTextStyle: AppTextStyle.BODY_LARGE)
                        ?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                  ),
                ),
                IconButton(
                  onPressed: (item.stock != null &&
                          item.stock! > 0 &&
                          item.stock! > item.quantity)
                      ? () => _onPressAddQuantity(item)
                      : null,
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: item.stock != null &&
                            item.stock! > 0 &&
                            item.stock! > item.quantity
                        ? Colors.greenAccent
                        : Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}


  _showDialogCustomer(BuildContext context) {
    DialogHelper.showBottomSheetDialog(
      context: context,
      title: 'Pembeli',
      content: Column(
        children: [
          TextField(
            controller: notifier.nameController,
            decoration: InputDecoration(
              label: const Text('Nama'),
              border: const OutlineInputBorder(),
              errorText: notifier.errorCustomer[InputOrderNotifier.NAME],
            ),
          ),
          const SizedBox(height: 10),
          DropdownMenu<String>(
            expandedInsets: const EdgeInsets.symmetric(horizontal: 1),
            label: const Text('Gender'),
            dropdownMenuEntries: notifier.genderListDropdown,
            controller: notifier.genderController,
            errorText: notifier.errorCustomer[InputOrderNotifier.GENDER],
          ),
          const SizedBox(height: 10),
          TextField(
            controller: notifier.notesController,
            decoration: const InputDecoration(
              label: Text('Notes'),
              border: OutlineInputBorder(),
            ),
            maxLines: null,
          ),
          const SizedBox(height: 10),
          TextField(
            controller: notifier.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              label: Text('Email'),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: notifier.phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              label: Text('Phone'),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            readOnly: true,
            onTap: () => _onPressBirthDay(context),
            controller: notifier.birthdayController,
            decoration: const InputDecoration(
              label: Text('Birthday'),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _onPressSaveCustomer(context),
              child: const Text('Simpan'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onPressBirthDay(BuildContext context) async {
    DateTime? birthday = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime.now(),
    );
    if (birthday != null) {
      notifier.birthdayController.text = DateTimeHelper.formatDateTime(
          dateTime: birthday, format: 'yyyy-MM-dd');
    }
  }

  _onPressSaveCustomer(BuildContext context) {
    Navigator.pop(context);
    notifier.validateCustomer();
  }

  _onPressAddProduct(BuildContext context) async {
    final List<ProductItemOrderEntity>? items = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddProductOrderScreen(
          param1: notifier.listOrderItem,
        ),
      ),
    );
    if (items != null) notifier.updateItems(items);
  }

  _onPressBarcode(BuildContext context) {
    QrBarCodeScannerDialog().getScannedQrBarCode(
      context: context,
      onCode: (code) {
        notifier.scan(code ?? '');
      },
    );
  }

  _onPressRemoveQuantity(ProductItemOrderEntity item) {
    notifier.updateQuantity(item, item.quantity - 1);
  }

  _onPressAddQuantity(ProductItemOrderEntity item) {
    notifier.updateQuantity(item, item.quantity + 1);
  }

  _onPressCheckout(BuildContext context) async {
    bool? isDone = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckoutScreen(param1: notifier.order),
      ),
    );
    if (isDone ?? false) Navigator.pop(context);
  }
}
