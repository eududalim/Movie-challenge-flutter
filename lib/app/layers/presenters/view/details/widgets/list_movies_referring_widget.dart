import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../shared/dependency_injection/dependency_injection.dart';
import '../../../../../shared/helpers/api_conts.dart';
import '../../../../domain/states/list_movies_states_model.dart';
import '../../../controllers/details_controller.dart';
import '../../common/error_widget_custom.dart';

class ListMoviesReferringWidget extends StatelessWidget {
  const ListMoviesReferringWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = inject.get<DetailsController>();
    return ValueListenableBuilder(
      valueListenable: controller.listMoviesState,
      builder: (context, state, child) {
        if (state is MoviesLoadingState) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.white24,
          ));
        }
        if (state is MoviesSuccessState) {
          var list = state.data;
          return Column(
              children: list
                  .map((movie) => Container(
                        constraints: const BoxConstraints(maxHeight: 110),
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 16),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: AspectRatio(
                                aspectRatio: 3 / 4,
                                child: Image.network(
                                  Api.getUrlImage(movie.imgPath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                  ),
                                  Container(
                                    height: 1,
                                    color:
                                        const Color.fromARGB(10, 255, 255, 255),
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
    );
  }
}
