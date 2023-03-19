import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_challenge_flutter/app/layers/domain/models/movie_model.dart';
import 'package:movie_challenge_flutter/app/layers/domain/states/list_movies_states_model.dart';
import 'package:movie_challenge_flutter/app/layers/presenters/controllers/details_controller.dart';
import 'package:movie_challenge_flutter/app/layers/presenters/view/common/progress_indicator_widget.dart';
import 'package:movie_challenge_flutter/app/layers/presenters/view/details/widgets/image_movie_widget.dart';
import 'package:movie_challenge_flutter/app/layers/presenters/view/details/widgets/infos_movie_details_widget.dart';
import 'package:movie_challenge_flutter/app/layers/presenters/view/details/widgets/list_movies_referring_widget.dart';
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
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: controller.movieState,
          builder: (context, state, _) {
            if (state is MoviesLoadingState) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.white24,
              ));
            }

            if (state is MoviesErrorState) {
              log(state.errorMessage);
              return ErrorWidgetCustom(errorMessage: state.errorMessage);
            }

            if (state is MoviesSuccessState) {
              var movie = state.data.first;
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ImageMovieWidget(
                      urlImg: Api.getUrlImage(movie.imgPath),
                    ),
                    InfosMovieDetailsWidget(movie: movie),
                    const ListMoviesReferringWidget(),
                  ],
                ),
              );
            }

            return Container();
          }),
    );
  }
}
