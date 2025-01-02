import 'package:dewakoding_kasir/app/domain/entity/order.dart';
import 'package:dewakoding_kasir/app/presentation/print/print_notifier.dart';
import 'package:dewakoding_kasir/core/helper/global_helper.dart';
import 'package:dewakoding_kasir/core/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/app_bar.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

class PrintScreen extends AppWidget<PrintNotifier, OrderEntity, void> {
  PrintScreen({required super.param1});

  @override
  AppBar? appBarBuild(BuildContext context) {
    return AppBar(
      title: Text('Cetak Invoice'),
    );
  }

  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: EdgeInsets.all(10),
      width: double.maxFinite,
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Icon(
            Icons.check_circle,
            size: 75,
            color: Colors.green,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Order berhasil disimpan',
            style: GlobalHelper.getTextTheme(context,
                appTextStyle: AppTextStyle.HEADLINE_SMALL),
          ),
          SizedBox(
            height: 20,
          ),
          _deviceLayout(context)
        ],
      ),
    ));
  }

  _deviceLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Daftar Printer',
          style: GlobalHelper.getTextTheme(context,
              appTextStyle: AppTextStyle.TITLE_MEDIUM),
        ),
        SizedBox(
          height: 10,
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => SizedBox(
            height: 5,
          ),
          itemCount: notifier.listBluetooth.length,
          itemBuilder: (context, index) {
            final item = notifier.listBluetooth[index];
            return _itemDeviceLayout(context, item);
          },
        )
      ],
    );
  }

  _itemDeviceLayout(BuildContext context, BluetoothInfo item) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
              color: GlobalHelper.getColorScheme(context).shadow, width: 0.5),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Icon(Icons.bluetooth_connected),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(item.name), Text(item.macAdress)],
          )),
          SizedBox(
            width: 5,
          ),
          FilledButton(
              onPressed: () => _onPressPrint(item), child: Text('Print'))
        ],
      ),
    );
  }

  _onPressPrint(BluetoothInfo item) {
    notifier.print(item.macAdress);
  }
}
