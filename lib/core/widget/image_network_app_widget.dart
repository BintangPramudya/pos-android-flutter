import 'package:dewakoding_kasir/core/helper/global_helper.dart';
import 'package:flutter/material.dart';

class ImageNetworkAppWidget extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? witdh;
  final BoxFit? boxFit;
  const ImageNetworkAppWidget(
      {super.key,
      required this.imageUrl,
      this.height,
      this.witdh,
      this.boxFit});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: height,
      width: witdh,
      fit: boxFit ?? BoxFit.fitWidth,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          color: GlobalHelper.getColorScheme(context).surfaceContainer,
          height: height,
          width: witdh,
          child: Center(
            child: CircularProgressIndicator(
              value: (loadingProgress.expectedTotalBytes != null)
                  ? (loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!)
                  : null,
            ),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: height,
          width: witdh,
          color: GlobalHelper.getColorScheme(context).surfaceContainer,
          child: Center(
            child: Icon(
              Icons.image_not_supported,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
