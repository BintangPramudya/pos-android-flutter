import 'package:bintang_kasir/app/domain/entity/product.dart';
import 'package:bintang_kasir/app/presentation/add_product_order/add_product_order_notifier.dart';
import 'package:bintang_kasir/core/helper/global_helper.dart';
import 'package:bintang_kasir/core/helper/number_helper.dart';
import 'package:bintang_kasir/core/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

class AddProductOrderScreen extends AppWidget<AddProductOrderNotifier, List<ProductItemOrderEntity>, void> {
  AddProductOrderScreen({required super.param1});

  @override
  AppBar? appBarBuild(BuildContext context) {
    return AppBar(
      title: Text('Tambah Produk'),
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      elevation: 4,
      toolbarHeight: 70,
    );
  }

  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Search bar and scan button
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: notifier.searchController,
                    decoration: InputDecoration(
                      hintText: 'Cari nama atau barcode produk',
                      label: Text('Cari Produk'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: _onPressClearSearch,
                        icon: Icon(Icons.clear, color: Colors.grey.shade600),
                      ),
                    ),
                    onSubmitted: (value) => _onSubmitSearch(),
                  ),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () => _onPressScan(context),
                  child: Icon(Icons.qr_code_scanner),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  elevation: 2,
                ),
              ],
            ),
            SizedBox(height: 12),
            // List of products
            Expanded(
              child: notifier.listOrderItem.isNotEmpty
                  ? ListView.separated(
                      separatorBuilder: (context, index) => Divider(color: Colors.grey.shade200),
                      itemCount: notifier.listOrderItem.length,
                      itemBuilder: (context, index) {
                        final item = notifier.listOrderItem[index];
                        return _itemOrderLayout(context, item);
                      },
                    )
                  : Center(
                      child: Text(
                        'Tidak ada produk ditemukan.',
                        style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                      ),
                    ),
            ),
            SizedBox(height: 10),
            // Total product and save button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${notifier.totalProduct} Item',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _onPressSave(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(
                    'Simpan',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,

                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemOrderLayout(BuildContext context, ProductItemOrderEntity item) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              Text(
                NumberHelper.formatIdr(item.price),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: GlobalHelper.getColorScheme(context).primary,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Text(
                'Stok: ${item.stock}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: (item.quantity > 0) ? () => _onPressRemoveQuantity(item) : null,
                icon: Icon(Icons.remove_circle, color: item.quantity > 0 ? Colors.red : Colors.grey),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  '${item.quantity}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              IconButton(
                onPressed: (item.stock != null && item.stock! > 0 && item.stock! > item.quantity)
                    ? () => _onPressAddQuantity(item)
                    : null,
                icon: Icon(Icons.add_circle, color: (item.stock != null && item.stock! > 0 && item.stock! > item.quantity) ? Colors.green : Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onSubmitSearch() {
    notifier.submitSearch();
  }

  void _onPressClearSearch() {
    notifier.clearSearch();
  }

  void _onPressScan(BuildContext context) {
    QrBarCodeScannerDialog().getScannedQrBarCode(
        context: context,
        onCode: (code) {
          notifier.scan(code ?? '');
        });
  }

  void _onPressAddQuantity(ProductItemOrderEntity item) {
    notifier.updateQuantity(item, item.quantity + 1);
  }

  void _onPressRemoveQuantity(ProductItemOrderEntity item) {
    notifier.updateQuantity(item, item.quantity - 1);
  }

  void _onPressSave(BuildContext context) {
    Navigator.pop(context, notifier.listOrderItemFilteredQuantity);
  }
}
