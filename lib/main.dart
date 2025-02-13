import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie/splash.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'home/view/screen/home_screen.dart';
import 'home_datails/view_model/movies_view_model.dart';
import 'movies_category_details/view/screens/category_details.dart';
import 'movies_details/view/screens/movie_details_new.dart';
import 'shared/themes/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesViewModel()
            ..getMovies()
            ..getPopularMovies()
            ..getUpcomingMovies()
            ..getTopRatedMovies(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Splash.routeName: (_) => const Splash(),
          HomeScreen.routeName: (_) => const HomeScreen(),
          MovieDetailsNew.routeName: (_) => const MovieDetailsNew(),
          CategoryDetails.routeName: (_) => const CategoryDetails(),
        },
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        // home: Splash(),
      ),
    );
  }
}
