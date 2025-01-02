import 'package:bintang_kasir/app/domain/entity/order.dart';
import 'package:bintang_kasir/app/presentation/detail_order/detail_order_screen.dart';
import 'package:bintang_kasir/app/presentation/input_order/input_order_screen.dart';
import 'package:bintang_kasir/app/presentation/order/order_notifier.dart';
import 'package:bintang_kasir/core/helper/date_time_helper.dart';
import 'package:bintang_kasir/core/helper/global_helper.dart';
import 'package:bintang_kasir/core/helper/number_helper.dart';
import 'package:bintang_kasir/core/provider/app_provider.dart';
import 'package:bintang_kasir/core/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderScreen extends AppWidget<OrderNotifier, void, void> {
  @override
  AppBar? appBarBuild(BuildContext context) {
    return AppBar(
      title: Text('Order'),
      centerTitle: true,
      backgroundColor: Colors.red,
      foregroundColor: Colors.white, // Sesuaikan warna sesuai dengan LoginScreen
    );
  }

  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => notifier.init(),
        child: ListView.separated(
          padding: const EdgeInsets.all(10),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: notifier.listOrder.length,
          itemBuilder: (context, index) {
            final item =
                notifier.listOrder[notifier.listOrder.length - 1 - index];
            return _itemOrderLayout(context, item);
          },
        ),
      ),
    );
  }

  @override
  Widget? floatingActionButtonBuild(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _onPressAddOrder(context),
      child: const Icon(Icons.add),
      backgroundColor: Colors.red,
      foregroundColor: Colors.white, // Sesuaikan warna sesuai dengan LoginScreen
    );
  }

  Widget _itemOrderLayout(BuildContext context, OrderEntity item) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () => _onPressItemOrder(context, item),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.name,
                    style: GlobalHelper.getTextTheme(context,
                            appTextStyle: AppTextStyle.TITLE_MEDIUM)
                        ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: GlobalHelper.getColorScheme(context)
                                .onSurface), // Sesuaikan warna teks
                  ),
                  Text(
                    DateTimeHelper.formatDateTimeFromString(
                      dateTimeString: item.updatedAt!,
                      format: 'dd MMM yyyy HH:mm',
                    ),
                    style: GlobalHelper.getTextTheme(context,
                            appTextStyle: AppTextStyle.LABEL_SMALL)
                        ?.copyWith(
                            color: GlobalHelper.getColorScheme(context)
                                .secondary), // Sesuaikan warna teks
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${NumberHelper.formatIdr(item.totalPrice!)} (${item.items.length} item)',
                    style: GlobalHelper.getTextTheme(context,
                            appTextStyle: AppTextStyle.BODY_LARGE)
                        ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: GlobalHelper.getColorScheme(context)
                                .primary), // Sesuaikan warna teks
                  ),
                  Chip(
                    label: Text(item.paymentMethod!.name),
                    backgroundColor: GlobalHelper.getColorScheme(context)
                        .primary
                        .withOpacity(0.1), // Sesuaikan warna latar belakang chip
                    labelStyle: TextStyle(
                      color:
                          GlobalHelper.getColorScheme(context).primary, // Sesuaikan warna label
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onPressItemOrder(BuildContext context, OrderEntity item) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailOrderScreen(param1: item.id),
      ),
    );
    notifier.init();
  }

  Future<void> _onPressAddOrder(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InputOrderScreen(),
      ),
    );
    notifier.init();
  }
}
