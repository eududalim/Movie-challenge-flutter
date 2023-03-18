import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_challenge_flutter/app/layers/domain/states/list_movies_states_model.dart';
import 'package:movie_challenge_flutter/app/layers/presenters/controllers/details_controller.dart';
import 'package:movie_challenge_flutter/app/layers/presenters/view/common/progress_indicator_widget.dart';
import 'package:movie_challenge_flutter/app/shared/dependency_injection/dependency_injection.dart';
import 'package:movie_challenge_flutter/app/shared/helpers/api_conts.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});
  static const route = '/';

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    controller.loadDetailMovie();
    super.initState();
  }

  final controller = inject.get<DetailsController>();

  @override
  Widget build(BuildContext context) {
    final heightImg = MediaQuery.of(context).size.height * 0.47;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: heightImg,
              width: double.infinity,
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black54,
                    Colors.transparent,
                    Theme.of(context).scaffoldBackgroundColor
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              // decoration: BoxDecoration(boxShadow: [
              //   BoxShadow(
              //       color: Theme.of(context).scaffoldBackgroundColor,
              //       offset: Offset.fromDirection(2),
              //       blurRadius: 10)
              // ]),
              child: ValueListenableBuilder(
                  valueListenable: controller.movieState,
                  builder: (context, state, _) {
                    if (state is MoviesLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is MoviesSuccessState) {
                      var movie = state.data.first;
                      return Image.network(
                        Api.getUrlImage(movie.imgPath),
                        fit: BoxFit.cover,
                      );
                    }
                    if (state is MoviesErrorState) {
                      log(state.errorMessage);
                      return Center(
                          child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.errorMessage,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Icon(
                              Icons.error_outline,
                              size: 35,
                            ),
                          ],
                        ),
                      ));
                    }

                    return Container();
                  }),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              constraints: const BoxConstraints(maxHeight: 400, minHeight: 50),
              child: ValueListenableBuilder(
                  valueListenable: controller.movieState,
                  builder: (context, state, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: getText(context, state),
                        ),
                        const SizedBox(width: 22),
                        ValueListenableBuilder(
                            valueListenable: controller.like,
                            builder: (context, like, _) {
                              return IconButton(
                                icon: Icon(like
                                    ? Icons.favorite
                                    : Icons.favorite_border),
                                onPressed: () => controller.setLike(!like),
                                iconSize: 28,
                              );
                            })
                      ],
                    );
                  }),
            ),
            //    ValueListenableBuilder(valueListenable: controller, builder: builder)
          ],
        ),
      ),
    );
  }

  getText(BuildContext context, MoviesState state) {
    if (state is MoviesSuccessState) {
      return Text(
        state.data.first.title,
        style: Theme.of(context).textTheme.headlineSmall,
        //       maxLines: 4,
      );
    } else {
      return customProgressIndicator();
    }
  }
}
