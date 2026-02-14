import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:golden_hub/core/constants/api_constants.dart';
import 'package:golden_hub/core/errors/failure.dart';
import 'package:golden_hub/core/services/api_service.dart';
import 'package:golden_hub/features/home/data/models/history_metal_model.dart';
import 'package:golden_hub/features/home/data/models/metal_model.dart';
import 'package:golden_hub/features/home/data/repo/metal_repo.dart';

class MetalRepoImpl extends MetalRepo {
  final ApiService apiService;

  MetalRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, MetalModel>> getCurrentMetalPrice({
    required MetalType metalType,
  }) async {
    try {
      String symbol = metalType == MetalType.gold ? 'XAU' : 'XAG';
      final response = await apiService.get(
        endpoint: '${ApiConstants.currentMetalPrice}$symbol',
      );
      return right(MetalModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HistoryMetalModel>>> getMetalHistory({
    required MetalType metalType,
  }) async {
    try {
      String symbol = metalType == MetalType.gold ? 'XAU' : 'XAG';
      final end = DateTime.now();
      final start = end.subtract(const Duration(days: 7));

      final startTimestamp = start.millisecondsSinceEpoch ~/ 1000;

      final endTimestamp = end.millisecondsSinceEpoch ~/ 1000;

      final response = await apiService.get(
        endpoint:
            '${ApiConstants.historyMetalPrice}'
            'symbol=$symbol&'
            'startTimestamp=$startTimestamp'
            '&endTimestamp=$endTimestamp'
            '&groupBy=day'
            '&aggregation=max'
            '&orderBy=desc',
      );
      final List data = response.data;
      log(data.toString());
      return right(data.map((e) => HistoryMetalModel.fromJson(e)).toList());
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
