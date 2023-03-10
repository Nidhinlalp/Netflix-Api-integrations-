import 'package:custom_splash/custom_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/infrastructure/home/home_first_image.dart';
import 'package:netflix/infrastructure/home/sout_indian_movie.dart';
import 'package:netflix/infrastructure/home/tense_drama.dart';
import 'package:netflix/infrastructure/home/top_10_show_in_india_today.dart';
import 'package:netflix/infrastructure/home/trending_now.dart';
import 'package:netflix/infrastructure/hotandnew/every_one_wathing.dart';
import 'package:netflix/infrastructure/hotandnew/coming_soon.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/domain/core/di/injectable.dart';
import 'package:netflix/presentation/main_page/widgets/screen_main_page.dart';

import 'infrastructure/home/home_relese_paster.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  getHotAndSNewEveryWatching();
  getHotandNewComingSoon();
  getHomeImage();
  getHomerelesethePastYear();
  getHomeTrendingNow();
  getHomeTendeAndDrama();
  getHomeSouthIndian();
  getHomeTop10showindia();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<DownloadsBloc>()),
        BlocProvider(create: (context) => getIt<SearchBloc>()),
        BlocProvider(create: (context) => getIt<FastLaughBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: backgroundColor),
          fontFamily: GoogleFonts.montserrat().fontFamily,
          scaffoldBackgroundColor: backgroundColor,
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
          ),
          // useMaterial3: true,
          backgroundColor: Colors.black,
          primarySwatch: Colors.blue,
        ),
        home: CustomSplash(
          imagePath: 'assets/images/splash.gif',
          backGroundColor: Colors.black,
          animationEffect: 'zoom-in',
          logoSize: 200,
          home: ScreenMainPage(),
          duration: 3500,
          type: CustomSplashType.StaticDuration,
        ),
      ),
    );
  }
}
