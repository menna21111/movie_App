import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movieapp/core/utls/apiservice.dart';

import '../../../core/eror/failure.dart';
import '../../../core/utls/api/url.dart';
import '../../categries/data/modeld/generesmodel.dart';
import '../../home/data/models/movieresponsemodel.dart';
import '../../movie/data/models/castmodel.dart';
import 'models/tvdetails.dart';
import 'models/tvresponse.dart';

class Tvrepo {
  final Apiservice apiservice;

  Tvrepo(this.apiservice);

  Future<Either<Failure, TVShowResponse>> nowontv() async {
    try {
      final response = await apiservice.get(
        endpoint: 'tv/on_the_air',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${URL.accessToken}',
            'Content-Type': 'application/json',
          },
        ),
      );
      final data = TVShowResponse.fromJson(response);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }  
  Future<Either<Failure, TVShowResponse>> populartv() async {
    try {
      final response = await apiservice.get(
        endpoint: 'tv/top_rated',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${URL.accessToken}',
            'Content-Type': 'application/json',
          },
        ),
      );
      final data = TVShowResponse.fromJson(response);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }  
  Future<Either<Failure, GenreResponse>> getgenretv() async {
    try {
      final response = await apiservice.get(
        endpoint: 'genre/tv/list',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${URL.accessToken}',
            'Content-Type': 'application/json',
          },
        ),
      );
      final data = GenreResponse.fromJson(response);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }Future<Either<Failure, MovieResponse>> gettvgener(int genrid) async {
    try {
      final response = await apiservice.search(
        endpoint: 'discover/tv',
        name: 'with_genres=',
        query: '$genrid',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${URL.accessToken}',
            'Content-Type': 'application/json',
          },
        ),
      );
      final data = MovieResponse.fromJson(response);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

 Future<Either<Failure, TvShowDetails>> getdetailstv(int tvid) async {
    try {
      final response = await apiservice.get(
        endpoint: 'tv/$tvid',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${URL.accessToken}',
            'Content-Type': 'application/json',
          },
        ),
      );
      final data = TvShowDetails.fromJson(response);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
 
 Future<Either<Failure, TvShowDetails>> getsimilattv(int tvid) async {
    try {
      final response = await apiservice.get(
        endpoint: 'tv//$tvid/similar',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${URL.accessToken}',
            'Content-Type': 'application/json',
          },
        ),
      );
      final data = TvShowDetails.fromJson(response);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
 Future<Either<Failure, CastResponse>> getcast(int tvid) async {
    try {
      final response = await apiservice.get(
        endpoint: 'tv/$tvid/credits',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${URL.accessToken}',
            'Content-Type': 'application/json',
          },
        ),
      );
      final data = CastResponse.fromJson(response);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
