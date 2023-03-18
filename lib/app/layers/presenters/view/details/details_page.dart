import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_challenge_flutter/app/layers/domain/states/list_movies_states_model.dart';
import 'package:movie_challenge_flutter/app/layers/presenters/controllers/details_controller.dart';
import 'package:movie_challenge_flutter/app/layers/presenters/view/common/progress_indicator_widget.dart';
import 'package:movie_challenge_flutter/app/shared/dependency_injection/dependency_injection.dart';
import 'package:movie_challenge_flutter/app/shared/helpers/api_conts.dart';

import 'widgets/error_widget_custom.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});
  static const route = '/';

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final controller = inject.get<DetailsController>();

  @override
  void initState() {
    controller.loadDetailMovie();
    controller.loadListMovies();
    super.initState();
  }

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
                      return ErrorWidgetCustom(
                          errorMessage: state.errorMessage);
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
            ValueListenableBuilder(
              valueListenable: controller.listMoviesState,
              builder: (context, state, child) {
                if (state is MoviesLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is MoviesSuccessState) {
                  var list = state.data;
                  return Column(
                      children: list
                          .map((movie) => Container(
                                constraints:
                                    const BoxConstraints(maxHeight: 110),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                child: Row(
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 3 / 4,
                                      child: Image.network(
                                        Api.getUrlImage(movie.imgPath),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            movie.title,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            '${movie.yearRelease}  ${movie.listGenres.toString().replaceFirst('[', '').replaceAll(']', '')}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ))
                          .toList());
                }
                if (state is MoviesErrorState) {
                  log(state.errorMessage);
                  return ErrorWidgetCustom(errorMessage: state.errorMessage);
                }

                return Container();
              },
            )
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
