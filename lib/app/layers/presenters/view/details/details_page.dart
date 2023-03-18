import 'package:flutter/material.dart';
import 'package:movie_challenge_flutter/app/layers/domain/states/list_movies_states_model.dart';
import 'package:movie_challenge_flutter/app/layers/presenters/controllers/details_controller.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(),
                child: ValueListenableBuilder(
                    valueListenable: controller.movieState,
                    builder: (context, state, _) {
                      if (state is MoviesLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is MoviesSuccessState) {
                        var movie = state.data.first;
                        return Image.network(Api.getUrlImage(movie.imgPath));
                      }

                      if (state is MoviesErrorState) {
                        return const Center(child: Icon(Icons.error_outline));
                      }

                      return Container();
                    }),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
