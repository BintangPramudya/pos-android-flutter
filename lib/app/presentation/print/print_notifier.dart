import 'package:bintang_kasir/app/domain/entity/order.dart';
import 'package:bintang_kasir/app/domain/entity/setting.dart';
import 'package:bintang_kasir/app/domain/usecase/setting_get.dart';
import 'package:bintang_kasir/core/helper/date_time_helper.dart';
import 'package:bintang_kasir/core/helper/number_helper.dart';
import 'package:bintang_kasir/core/provider/app_provider.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';

class PrintNotifier extends AppProvider {
  final OrderEntity _orderEntity;
  final SettingGetUseCase _settingGetUseCase;

  PrintNotifier(this._orderEntity, this._settingGetUseCase) {
    init();
  }

  SettingEntity? _settingStore;
  List<BluetoothInfo> _listBluetooth = [];

  List<BluetoothInfo> get listBluetooth => _listBluetooth;

  @override
  init() async {
    await _getSetting();
    await _getBluetoothStatus();
    if (errorMessage.isEmpty) await _getBluetoothPaired();
  }

  _getSetting() async {
    showLoading();
    final response = await _settingGetUseCase();
    if (response.success) {
      _settingStore = response.data!;
    } else {
      errorMessage = response.message;
    }
    hideLoading();
  }

  _getBluetoothStatus() async {
    showLoading();
    if (!await PrintBluetoothThermal.isPermissionBluetoothGranted) {
      errorMessage = 'Harap berikan perizinan bluetooth';
    } else if (!await PrintBluetoothThermal.bluetoothEnabled) {
      errorMessage = 'Harap aktifkan bluetooth';
    }
    hideLoading();
  }

  _getBluetoothPaired() async {
    showLoading();
    _listBluetooth = await PrintBluetoothThermal.pairedBluetooths;
    hideLoading();
  }

  print(String mac) async {
    showLoading();

    await PrintBluetoothThermal.connect(macPrinterAddress: mac);
    bool connectStatus = await PrintBluetoothThermal.connectionStatus;
    if (connectStatus) {
      List<int> ticket = await _generateInvoice();
      final result = await PrintBluetoothThermal.writeBytes(ticket);
      if (result) {
        snackBarMessage = 'Sukses print invoice';
      } else {
        snackBarMessage = 'Gagal print invoice';
      }
    } else {
      snackBarMessage = 'Tidak dapat terhubung pada bluetooth yang dipilih';
    }
    hideLoading();
  }

  Future<List<int>> _generateInvoice() async {
    final date = DateTimeHelper.formatDateTime(
        dateTime: DateTime.now(), format: 'dd MMM yyyy HH:mm:ss');
    final Generator ticket =
        Generator(PaperSize.mm58, await CapabilityProfile.load());
    List<int> bytes = [];

    // Informasi Toko
    if (_settingStore?.shop?.isNotEmpty ?? false) {
      bytes += ticket.text(_settingStore?.shop ?? '-',
          styles: PosStyles(
              align: PosAlign.center,
              height: PosTextSize.size2,
              width: PosTextSize.size2));
    }
    if (_settingStore?.address?.isNotEmpty ?? false) {
      bytes += ticket.text(_settingStore?.address ?? '-',
          styles: PosStyles(align: PosAlign.center));
    }
    if (_settingStore?.phone?.isNotEmpty ?? false) {
      bytes += ticket.text('Telp : ${_settingStore?.phone ?? '-'}',
          styles: PosStyles(align: PosAlign.center));
    }

    // Nama Pembeli
    if (_orderEntity.name?.isNotEmpty ?? false) {
      bytes += ticket.text('Nama Pembeli: ${_orderEntity.name}',
          styles: PosStyles(align: PosAlign.center));
    }

    // Tanggal dan Waktu
    bytes += ticket.feed(1);
    bytes += ticket.text(date, styles: PosStyles(align: PosAlign.center));

    // Pemisah
    bytes += ticket.feed(1);
    bytes += ticket.hr(ch: '-');

    // Header Produk
    bytes += ticket.text('Produk yang dipesan',
        styles: PosStyles(align: PosAlign.center, bold: true));
    bytes += ticket.hr(ch: '-');

    // Daftar Produk
    _orderEntity.items.forEach((element) {
      // Nama Produk
      bytes += ticket.text('${element.name}',
          styles: PosStyles(align: PosAlign.left));

      // Detail Produk (Harga, Jumlah, Total)
      bytes += ticket.row([
        PosColumn(
            text: NumberHelper.formatIdr(element.price),
            width: 4,
            styles: PosStyles(align: PosAlign.right)),
        PosColumn(
            text: '${element.quantity}' + ' x',
            width: 2,
            styles: PosStyles(align: PosAlign.center)),
        PosColumn(
            text: NumberHelper.formatIdr(element.price * element.quantity),
            width: 6,
            styles: PosStyles(align: PosAlign.right)),
      ]);
    });

    // Total Harga
    bytes += ticket.hr();
    bytes += ticket.row([
      PosColumn(
          text: 'TOTAL', width: 6, styles: PosStyles(align: PosAlign.right)),
      PosColumn(
          text: NumberHelper.formatIdr(_orderEntity.totalPrice!),
          width: 6,
          styles: PosStyles(align: PosAlign.right, bold: true)),
    ]);
    bytes += ticket.hr(ch: '=');

    // Jumlah yang Dibayar
    bytes += ticket.row([
      PosColumn(
          text: 'Jumlah Bayar',
          width: 6,
          styles: PosStyles(align: PosAlign.right)),
      PosColumn(
          text: NumberHelper.formatIdr(_orderEntity.paidAmount!),
          width: 6,
          styles: PosStyles(align: PosAlign.right)),
    ]);

    // Kembalian
    bytes += ticket.row([
      PosColumn(
          text: 'Kembalian',
          width: 6,
          styles: PosStyles(align: PosAlign.right)),
      PosColumn(
          text: NumberHelper.formatIdr(_orderEntity.changeAmount!),
          width: 6,
          styles: PosStyles(align: PosAlign.right)),
    ]);

    // Footer: Terima Kasih
    bytes +=
        ticket.feed(1); // Kurangi feed untuk menghindari jarak terlalu besar
    bytes += ticket.text(
      'Terima kasih',
      styles: PosStyles(align: PosAlign.center, bold: true),
    );

    // Akhiri cetakan dengan pemotongan
    bytes += ticket.cut();

    return bytes;
  }
}
