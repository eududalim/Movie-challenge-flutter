import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_challenge_flutter/app/layers/domain/models/movie_model.dart';

import '../../../../../shared/dependency_injection/dependency_injection.dart';
import '../../../controllers/details_controller.dart';

class InfosMovieDetailsWidget extends StatelessWidget {
  const InfosMovieDetailsWidget({super.key, required this.movie});
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    final controller = inject.get<DetailsController>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            padding: const EdgeInsets.all(16),
            constraints: const BoxConstraints(maxHeight: 400, minHeight: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    movie.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                    //       maxLines: 4,
                  ),
                ),
                const SizedBox(width: 22),
                ValueListenableBuilder(
                    valueListenable: controller.like,
                    builder: (context, like, _) {
                      return IconButton(
                        icon:
                            Icon(like ? Icons.favorite : Icons.favorite_border),
                        onPressed: () => controller.setLike(!like),
                        iconSize: 28,
                      );
                    })
              ],
            )),
        Container(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 18),
          child: Row(
            children: [
              const Icon(Icons.favorite),
              const SizedBox(width: 6),
              Text(
                getFormtLikes(movie.likes),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(width: 28),
              Transform.rotate(
                angle: -190,
                child: const Icon(Icons.contrast_outlined),
              ),
              const SizedBox(width: 6),
              Text(
                '${movie.views.toStringAsFixed(0)}K Views',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }

  String getFormtLikes(int numLikes) {
    var likes = numLikes.toString();

    log(likes.length.toString());

    if (likes.length > 3) {
      var part1 = likes.substring(0, likes.length - 3);
      var part2 = likes.substring(likes.length - 3, likes.length - 2);

      // ignore: unnecessary_string_escapes
      return '$part1.$part2\K Likes';
    } else {
      return '$likes\K Likes';
    }
  }
}
