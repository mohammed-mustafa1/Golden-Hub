import 'package:golden_hub/features/home/data/models/history_metal_model.dart';

abstract class MetalState {}

class MetalInitial extends MetalState {}

class MetalLoading extends MetalState {}

class MetalLoaded extends MetalState {}

class MetalHistoryLoaded extends MetalState {
  final List<HistoryMetalModel> historyMetal;
  MetalHistoryLoaded({required this.historyMetal});
}

class MetalError extends MetalState {
  final String message;
  MetalError({required this.message});
}
