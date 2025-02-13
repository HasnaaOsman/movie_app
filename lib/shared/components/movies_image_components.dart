import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../themes/app_theme.dart';
import 'loading_indicator.dart';

class MoviesImageComponents extends StatelessWidget {
  const MoviesImageComponents({
    super.key,
    this.isOpen = false,
    required this.image,
    this.icon = Icons.add,
    required this.backgroundBookmarkIcon,
    this.movieRate = '',
    this.movieTitle = '',
    this.movieDate = '',
  });

  final bool isOpen;
  final String image;
  final Color backgroundBookmarkIcon;
  final IconData icon;
  final String movieRate;
  final String movieTitle;
  final String movieDate;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Stack(
          alignment: Alignment.topLeft,
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
              child: CachedNetworkImage(
                imageUrl: image,
                placeholder: (context, url) => const LoadingIndicator(),
                errorWidget: (_, __, ___) =>
                    const Icon(Icons.image_not_supported),
                height: 150,
                width: 100,
              ),
            ),
            Positioned.directional(
              textDirection: TextDirection.ltr,
              top: -14.5,
              start: -18.5,
              child: IconButton(
                  onPressed: () {},
                  icon: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Icon(
                        Icons.bookmark,
                        size: 50,
                        color: backgroundBookmarkIcon,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 8,
                        ),
                        child: Icon(
                          icon,
                          color: AppTheme.white,
                          size: 18,
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
        isOpen
            ? Container(
                width: 95,
                padding: EdgeInsets.symmetric(
                  horizontal: width * .02,
                  vertical: height * .01,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.white.withOpacity(.16),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppTheme.primary,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          movieRate,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 10,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      movieTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 10,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      movieDate,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 8, color: AppTheme.gray),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
