import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_hub/core/services/api_service.dart';
import 'package:golden_hub/features/home/data/models/metal_model.dart';
import 'package:golden_hub/features/home/data/repo/metal_repo.dart';
import 'package:golden_hub/features/home/data/repo/metal_repo_impl.dart';
import 'package:golden_hub/features/home/presentation/cubit/metal_state.dart';

class MetalCubit extends Cubit<MetalState> {
  MetalCubit() : super(MetalInitial());
  MetalModel goldMetal = MetalModel(), silverMetal = MetalModel();

  final MetalRepo metalRepo = MetalRepoImpl(apiService: ApiService(dio: Dio()));

  Future<void> getMetalPrice({required MetalType metalType}) async {
    emit(MetalLoading());
    final result = await metalRepo.getCurrentMetalPrice(metalType: metalType);
    result.fold((error) => emit(MetalError(message: error.errorMessage)), (
      metal,
    ) {
      metalType == MetalType.gold ? goldMetal = metal : silverMetal = metal;
      emit(MetalLoaded());
    });
  }

  Future<void> getMetalHistory({required MetalType metalType}) async {
    emit(MetalLoading());
    final result = await metalRepo.getMetalHistory(metalType: metalType);
    result.fold((error) => emit(MetalError(message: error.errorMessage)), (
      historyMetal,
    ) {
      emit(MetalHistoryLoaded(historyMetal: historyMetal));
    });
  }
}
