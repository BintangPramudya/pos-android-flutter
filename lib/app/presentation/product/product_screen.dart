import 'package:dewakoding_kasir/app/domain/entity/product.dart';
import 'package:dewakoding_kasir/app/presentation/product/product_notifier.dart';
import 'package:dewakoding_kasir/core/helper/global_helper.dart';
import 'package:dewakoding_kasir/core/helper/number_helper.dart';
import 'package:dewakoding_kasir/core/widget/app_widget.dart';
import 'package:dewakoding_kasir/core/widget/image_network_app_widget.dart';
import 'package:flutter/material.dart';

class ProductScreen extends AppWidget<ProductNotifier, void, void> {
  @override
  AppBar? appBarBuild(BuildContext context) {
    return AppBar(
      title: Text('Produk'),
      centerTitle: true,
      backgroundColor: Colors.red,
    );
  }

  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => notifier.init(),
        child: ListView.separated(
          padding: EdgeInsets.all(10),
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemCount: notifier.listProduct.length,
          itemBuilder: (context, index) {
            final item = notifier.listProduct[index];
            return _itemLayout(context, item);
          },
        ),
      ),
    );
  }

  Widget _itemLayout(BuildContext context, ProductEntity item) {
    return Card(
      color: Colors.white, // Atur warna latar belakang menjadi putih
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(item.imageUrl ?? ''),
                    fit: BoxFit
                        .cover, // Gunakan BoxFit untuk memastikan gambar sesuai
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: GlobalHelper.getTextTheme(context,
                            appTextStyle: AppTextStyle.TITLE_SMALL)
                        ?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: GlobalHelper.getColorScheme(context).onSurface,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    NumberHelper.formatIdr(item.price),
                    style: GlobalHelper.getTextTheme(context,
                            appTextStyle: AppTextStyle.BODY_LARGE)
                        ?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: GlobalHelper.getColorScheme(context).primary,
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Stok: ${item.stock}',
                        style: GlobalHelper.getTextTheme(context,
                                appTextStyle: AppTextStyle.LABEL_MEDIUM)
                            ?.copyWith(
                          color: GlobalHelper.getColorScheme(context).onSurface,
                        ),
                      ),
                      Text(
                        item.isActive ? 'Aktif' : 'Tidak aktif',
                        style: GlobalHelper.getTextTheme(context,
                                appTextStyle: AppTextStyle.LABEL_MEDIUM)
                            ?.copyWith(
                                color:
                                    item.isActive ? Colors.green : Colors.red,
                                fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
