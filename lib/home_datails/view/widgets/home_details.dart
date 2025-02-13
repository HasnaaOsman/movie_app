import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../shared/components/error_indicator.dart';
import '../../../shared/components/loading_indicator.dart';
import '../../../shared/components/movies_container.dart';

import '../../view_model/movies_view_model.dart';
import 'movies_slider_items.dart';
import 'recommended_movies.dart';
import 'releases_movies.dart';

class HomeDetails extends StatefulWidget {
  const HomeDetails({super.key});

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  MoviesViewModel moviesViewModel = MoviesViewModel();

  @override
  void initState() {
    moviesViewModel.getPopularMovies();
    moviesViewModel.getUpcomingMovies();
    moviesViewModel.getTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Consumer<MoviesViewModel>(
      builder: (_, moviesViewModel, __) {
        return SafeArea(
          child: ListView(
            children: [
              moviesViewModel.popularIsLoading
                  ? SizedBox(
                      height: height * .42,
                      child: const LoadingIndicator(),
                    )
                  : moviesViewModel.errorPopularMessage != null
                      ? ErrorIndicator(
                          message: moviesViewModel.errorPopularMessage,
                        )
                      : CarouselSlider.builder(
                          itemBuilder: (_, index, __) {
                            final movie = moviesViewModel.popularMovies[index];
                            return MoviesSliderItems(
                              popularMovies: movie,
                            );
                          },
                          itemCount: moviesViewModel.popularMovies.length,
                          options: CarouselOptions(
                            height: height * .42,
                            autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                            scrollDirection: Axis.horizontal,
                            clipBehavior: Clip.none,
                            viewportFraction: 1,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            enlargeFactor: .15,
                            autoPlayInterval: const Duration(seconds: 5),
                            autoPlayAnimationDuration:
                                const Duration(seconds: 3),
                          ),
                        ),
              moviesViewModel.upcomingIsLoading
                  ? const SizedBox(
                      height: 225,
                      child: LoadingIndicator(),
                    )
                  : moviesViewModel.errorUpcomingMessage != null
                      ? ErrorIndicator(
                          message: moviesViewModel.errorUpcomingMessage,
                        )
                      : MoviesContainer(
                          categoryName: 'Upcoming ',
                          height: 225,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (_, index) => const SizedBox(
                              width: 10,
                            ),
                            itemBuilder: (_, index) => ReleasesMovies(
                              upcomingMovies:
                                  moviesViewModel.upcomingMovies[index],
                            ),
                            itemCount: moviesViewModel.upcomingMovies.length,
                          ),
                        ),
              SizedBox(
                height: height * .03,
              ),
              moviesViewModel.topRatedIsLoading
                  ? const SizedBox(
                      height: 310,
                      child: LoadingIndicator(),
                    )
                  : moviesViewModel.errorTopRatedMessage != null
                      ? ErrorIndicator(
                          message: moviesViewModel.errorTopRatedMessage,
                        )
                      : MoviesContainer(
                          categoryName: 'Top Rated',
                          height: 310,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (_, index) => const SizedBox(
                              width: 10,
                            ),
                            itemBuilder: (_, index) => RecommendedMovies(
                              topRatedMovies:
                                  moviesViewModel.topRatedMovies[index],
                            ),
                            itemCount: moviesViewModel.topRatedMovies.length,
                          ),
                        ),
            ],
          ),
        );
      },
    );
  }
}
