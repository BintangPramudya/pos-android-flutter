import 'package:flutter/material.dart';
import 'package:bintang_kasir/app/domain/entity/order.dart';
import 'package:bintang_kasir/app/presentation/detail_order/detail_order_screen.dart';
import 'package:bintang_kasir/app/presentation/home/home_notifier.dart';
import 'package:bintang_kasir/app/presentation/input_order/input_order_screen.dart';
import 'package:bintang_kasir/app/presentation/order/order_screen.dart';
import 'package:bintang_kasir/app/presentation/profil/profil_screen.dart';
import 'package:bintang_kasir/core/helper/date_time_helper.dart';
import 'package:bintang_kasir/core/helper/global_helper.dart';
import 'package:bintang_kasir/core/helper/number_helper.dart';
import 'package:bintang_kasir/core/widget/app_widget.dart';

class HomeScreen extends AppWidget<HomeNotifier, void, void> {
  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => notifier.init(),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          children: [
            _headerLayout(context),
            SizedBox(height: 20),
            _orderTodayLayout(context),
          ],
        ),
      ),
    );
  }

  @override
  Widget? floatingActionButtonBuild(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _onPressAddOrder(context),
      child: Icon(Icons.add, size: 30),
      backgroundColor: Colors.redAccent,
      foregroundColor: Colors.white,
    );
  }

  _headerLayout(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.redAccent, Colors.red],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => _onPressAvatar(context),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              child: Text(
                notifier.name.substring(0, 1).toUpperCase(),
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notifier.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  notifier.email,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _orderTodayLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Hari Ini',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              FilledButton(
                onPressed: () => _onPressShowAllOrder(context),
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Lihat Semua',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: notifier.listOrder.length,
            itemBuilder: (context, index) {
              final item = notifier.listOrder[index];
              return _itemOrderLayout(context, item);
            },
          ),
        ],
      ),
    );
  }

  _itemOrderLayout(BuildContext context, OrderEntity item) {
  return Card(
    color: Colors.white, // Set the background color to white
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              Text(
                DateTimeHelper.formatDateTimeFromString(
                  dateTimeString: item.updatedAt!,
                  format: 'dd MMM yyyy HH:mm:ss',
                ),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${NumberHelper.formatIdr(item.totalPrice!)} (${item.items.length} item)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Chip(
                label: Text(
                  item.paymentMethod!.name,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.redAccent,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}


  _onPressAvatar(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilScreen()),
    );
  }

  _onPressAddOrder(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InputOrderScreen()),
    );
    notifier.init();
  }

  _onPressShowAllOrder(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OrderScreen()),
    );
    notifier.init();
  }
}
