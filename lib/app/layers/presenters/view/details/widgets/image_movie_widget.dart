import 'package:flutter/material.dart';

import '../../../../../shared/helpers/api_conts.dart';

class ImageMovieWidget extends StatelessWidget {
  const ImageMovieWidget({super.key, required this.urlImg});

  final String urlImg;

  @override
  Widget build(BuildContext context) {
    final heightImg = MediaQuery.of(context).size.height * 0.48;

    return Container(
        height: heightImg,
        width: double.infinity,
        foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black87,
              Colors.transparent,
              Theme.of(context).scaffoldBackgroundColor
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Image.network(
          urlImg,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress != null) {
              return Center(
                  child: CircularProgressIndicator(
                value: ((loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!)),
                color: Colors.white24,
                strokeWidth: 8,
              ));
            }
            return child;
          },
        ));
  }
}
