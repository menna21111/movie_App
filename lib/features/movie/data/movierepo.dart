import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movieapp/core/utls/api/url.dart';
import 'package:movieapp/core/utls/apiservice.dart';

import '../../../core/eror/failure.dart';
import '../../home/data/models/movieresponsemodel.dart';
import 'models/castmodel.dart';
import 'models/moviedetails.dart';
import 'models/review.dart';
import 'models/videomodel.dart';

class Movierepo {
  final Apiservice apiservice;

  Movierepo(this.apiservice);

  Future<Either<Failure, CastResponse>> getcast(int movieid) async {
    try {
      final response = await apiservice.get(
        endpoint: 'movie/$movieid/credits',
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

  Future<Either<Failure, VideoResponse>> displayvideo(int movieid) async {
    try {
      final response = await apiservice.get(
        endpoint: 'movie/$movieid/videos',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${URL.accessToken}',
            'Content-Type': 'application/json',
          },
        ),
      );
      final data = VideoResponse.fromJson(response);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, ReviewResponse>> getreviews(int movieid) async {
    try {
      final response = await apiservice.get(
        endpoint: 'movie/$movieid/reviews',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${URL.accessToken}',
            'Content-Type': 'application/json',
          },
        ),
      );
      final data = ReviewResponse.fromJson(response);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, MovieResponse>> getsimiliarmov(int movieid) async {
    try {
      final response = await apiservice.get(
        endpoint: 'movie/$movieid/similar',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${URL.accessToken}',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (!response.containsKey('status_code')) {
        final data = MovieResponse.fromJson(response);
        return right(data);
      }else{
        return left(ServerFailure(response['status_message'].toString()));
      }
  
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, MovieDetails>> getdetailsmov(int movieid) async {
    try {
      final response = await apiservice.get(
        endpoint: 'movie/$movieid',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${URL.accessToken}',
            'Content-Type': 'application/json',
          },
        ),
      );
      final data = MovieDetails.fromJson(response);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, MovieResponse>> addrating(int movieid) async {
    try {
      final response = await apiservice.delete(
        endpoint: 'movie/$movieid',
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
}
