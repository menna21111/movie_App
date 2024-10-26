


import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movieapp/core/utls/apiservice.dart';
import 'package:movieapp/features/fav/presination/manager/bloc/fav_bloc.dart';
import 'package:movieapp/features/home/data/homerepo.dart';
import 'package:movieapp/features/home/pres/manager/bloc/topratedbloc/bloc/toprated_bloc.dart';
import 'package:movieapp/features/splash/splachscreanview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/features/tv/data/tvrepo.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


import 'features/categries/data/genrerepo.dart';
import 'features/categries/pres/manager/bloc/getting_catg_bloc.dart';
import 'features/categries/pres/manager/bloc/moviegeners_bloc.dart';
import 'features/fav/data/models/moviedetails.dart';
import 'features/fav/presination/manager/bloc/updatebloc.dart';
import 'features/home/pres/manager/bloc/UPCOMINGBLOC/homeblock_bloc.dart';
import 'features/home/pres/manager/bloc/popular/bloc/populars_bloc.dart';
import 'features/movie/data/movierepo.dart';
import 'features/movie/pres/MANAGER/bloc/cast/bloc/cast_bloc.dart';
import 'features/movie/pres/MANAGER/bloc/detailsmoviebloc/moviebloc_bloc.dart';
import 'features/movie/pres/MANAGER/bloc/similarmovie/bloc/similiar_bloc.dart';
import 'features/movie/pres/MANAGER/bloc/videobloc/bloc/video_bloc.dart';
import 'features/rating/data/raterepo.dart';
import 'features/rating/pres/manager/bloc/addrating_bloc.dart';
import 'features/rating/pres/manager/bloc/deleterate_bloc.dart';
import 'features/rating/pres/manager/bloc/getrating_bloc.dart';
import 'features/rating/pres/manager/bloc/reviewbloc/bloc/review_bloc.dart';
import 'features/search/data/searchrepo.dart';
import 'features/search/pres/MANAGER/bloc/searchbloc_bloc.dart';
import 'features/tv/pres/manager/bloc/casttv_bloc.dart';
import 'features/tv/pres/manager/bloc/detailstv_bloc.dart';
import 'features/tv/pres/manager/bloc/nowontv_bloc.dart';


void main()async {
  Dio dio = Dio();
  if (!kReleaseMode) {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ));
  }

   await Hive.initFlutter();
  Hive.registerAdapter(MovieDetailssAdapter());
  await Hive.openBox<MovieDetailss>('movieBox');
  runApp( MovieApp(
        dio: dio,
  ));
}

class MovieApp extends StatelessWidget {
  const MovieApp ({super.key, required this.dio});

 final Dio dio;
  @override


  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
             HomeblockBloc   (Homerepo(Apiservice(Dio()))
             )
             ,), 
        BlocProvider(
            create: (BuildContext context) =>
             GettingCatgBloc   (Generrepo(Apiservice(Dio()))
             )
             ,), 
        BlocProvider(
            create: (BuildContext context) =>
             TopratedBloc   (Homerepo(Apiservice(Dio()))
             )
             ,), 
        BlocProvider(
            create: (BuildContext context) =>
             MovieblocBloc   (Movierepo(Apiservice(Dio()))
             ),
             ), 
        BlocProvider(
            create: (BuildContext context) =>
             Updatebloc   ()
             ),
        BlocProvider(
            create: (BuildContext context) =>
             FavBloc   ()
             ),
        BlocProvider(
            create: (BuildContext context) =>
             CastBloc   (Movierepo(Apiservice(Dio())))
             ),
        BlocProvider(
            create: (BuildContext context) =>
             SimiliarBloc   (Movierepo(Apiservice(Dio())))
             ),
        BlocProvider(
            create: (BuildContext context) =>
             VideoBloc   (Movierepo(Apiservice(Dio())))
             ),
        BlocProvider(
            create: (BuildContext context) =>
             PopularsBloc   (Homerepo(Apiservice(Dio())))
             ),
        BlocProvider(
            create: (BuildContext context) =>
             SearchblocBloc   (Searchrepo(Apiservice(Dio())))
             ),
        BlocProvider(
            create: (BuildContext context) =>
             NowontvBloc   (Tvrepo(Apiservice(Dio())))
             ),
        BlocProvider(
            create: (BuildContext context) =>
             DetailstvBloc   (Tvrepo(Apiservice(Dio())))
             ),
        BlocProvider(
            create: (BuildContext context) =>
             CasttvBloc   (Tvrepo(Apiservice(Dio())))
             ),
        BlocProvider(
            create: (BuildContext context) =>
             MoviegenersBloc   (Generrepo(Apiservice(Dio())))
             ),
        BlocProvider(
            create: (BuildContext context) =>
             ReviewBloc   (Movierepo(Apiservice(Dio())))
             ),
        BlocProvider(
            create: (BuildContext context) =>
             AddratingBloc   (Raterepo(Apiservice(Dio())))
             ),
        BlocProvider(
            create: (BuildContext context) =>
             DeleterateBloc   (Raterepo(Apiservice(Dio())))
             ),
        BlocProvider(
            create: (BuildContext context) =>
             GetratingBloc   (Raterepo(Apiservice(Dio())))
             ),
              
      ],
      child: MaterialApp(
        
      builder: (context, child) {
            return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: TextScaler.linear(1.0)),
                child: child!);
          },
      
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(surface: Colors.black),
          useMaterial3: true,
            textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.white), // sets the text color to white
  ),
        ),
        home:const Splachscreanview(),
      
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
