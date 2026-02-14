import 'package:dartz/dartz.dart';
import 'package:golden_hub/core/errors/failure.dart';
import 'package:golden_hub/features/home/data/models/history_metal_model.dart';
import 'package:golden_hub/features/home/data/models/metal_model.dart';

abstract class MetalRepo {
  Future<Either<Failure, MetalModel>> getCurrentMetalPrice({
    required MetalType metalType,
  });
  Future<Either<Failure, List<HistoryMetalModel>>> getMetalHistory({
    required MetalType metalType,
  });
}
