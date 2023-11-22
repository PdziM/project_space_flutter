import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageViewContainer extends StatelessWidget {
  final String? imageLink;

  const ImageViewContainer({super.key, this.imageLink});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return CachedNetworkImage(
      imageUrl: imageLink ?? '',
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container(),
      errorWidget: (context, url, error) => Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 35, color: Colors.red),
              const SizedBox(height: 8),
              AutoSizeText(
                'Não foi possível carregar imagem',
                style: textTheme.titleSmall!.copyWith(fontSize: 10),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
