import 'package:bintang_kasir/app/domain/entity/order.dart';
import 'package:bintang_kasir/app/domain/entity/product.dart';
import 'package:bintang_kasir/app/presentation/checkout/checkout_notifier.dart';
import 'package:bintang_kasir/app/presentation/detail_order/detail_order_notifier.dart';
import 'package:bintang_kasir/app/presentation/print/print_screen.dart';
import 'package:bintang_kasir/core/helper/date_time_helper.dart';
import 'package:bintang_kasir/core/helper/global_helper.dart';
import 'package:bintang_kasir/core/helper/number_helper.dart';
import 'package:bintang_kasir/core/widget/app_widget.dart';
import 'package:flutter/material.dart';

class DetailOrderScreen extends AppWidget<DetailOrderNotifier, int, void> {
  DetailOrderScreen({required super.param1});

  @override
  AppBar? appBarBuild(BuildContext context) {
    return AppBar(
      title: Text('Detail Order'),
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      centerTitle: true,
    );
  }

  @override
  Widget bodyBuild(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        _buildSectionTitle(context, 'Pembeli'),
        _customerLayout(context),
        _divider(context),
        _buildSectionTitle(context, 'Produk Dipesan'),
        _productLayout(context),
        _divider(context),
        _buildSectionTitle(context, 'Ringkasan Pembayaran'),
        _paymentLayout(context),
        const SizedBox(height: 30),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _onPressPrint(context),
            icon: const Icon(Icons.print),
            label: const Text('Print Invoice'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15),
              textStyle: const TextStyle(fontSize: 16),
            ),
          ),
        )
      ],
    );
  }

  Widget _customerLayout(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: _cardDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _infoRow(context, Icons.person, 'Nama', notifier.order!.name),
          _infoRow(
            context,
            (notifier.order!.gender == CheckoutNotifier.MALE)
                ? Icons.male
                : Icons.female,
            'Jenis Kelamin',
            (notifier.order!.gender == CheckoutNotifier.MALE)
                ? 'Laki-laki'
                : 'Perempuan',
          ),
          _infoRow(context, Icons.email, 'Email', notifier.order!.email ?? '-'),
          _infoRow(context, Icons.phone, 'Telepon', notifier.order!.phone ?? '-'),
          _infoRow(
            context,
            Icons.event,
            'Tanggal Lahir',
            notifier.order!.birthday != null
                ? DateTimeHelper.formatDateTimeFromString(
                    dateTimeString: notifier.order!.birthday!,
                    format: 'dd MMM yyyy')
                : '-',
          ),
          const SizedBox(height: 10),
          Text('Catatan:',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
          Text(notifier.order!.notes ?? '-',
              style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }

  Widget _productLayout(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: notifier.order!.items.length,
      itemBuilder: (context, index) {
        final item = notifier.order!.items[index];
        return _itemProductLayout(context, item);
      },
    );
  }

  Widget _itemProductLayout(BuildContext context, ProductItemOrderEntity item) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: _cardDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.name,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${item.quantity} x ${NumberHelper.formatIdr(item.price)}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          )
        ],
      ),
    );
  }

  Widget _paymentLayout(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: _cardDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _infoRow(context, Icons.payment, 'Metode Pembayaran',
              notifier.order!.paymentMethod!.name),
          _infoRow(context, Icons.attach_money, 'Total Bayar',
              NumberHelper.formatIdr(notifier.order!.totalPrice ?? 0)),
          _infoRow(context, Icons.payments, 'Nominal Bayar',
              NumberHelper.formatIdr(notifier.order!.paidAmount ?? 0)),
          _infoRow(context, Icons.change_circle, 'Kembalian',
              NumberHelper.formatIdr(notifier.order!.changeAmount ?? 0)),
        ],
      ),
    );
  }

  Widget _infoRow(
      BuildContext context, IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '$label: $value',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider(BuildContext context) {
    return Divider(
      color: Theme.of(context).colorScheme.outline,
      thickness: 2,
      height: 20,
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  BoxDecoration _cardDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  void _onPressPrint(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PrintScreen(param1: notifier.order),
      ),
    );
  }
}
