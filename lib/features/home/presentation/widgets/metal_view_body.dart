import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_hub/core/constants/app_colors.dart';
import 'package:golden_hub/features/home/data/models/metal_model.dart';
import 'package:golden_hub/features/home/presentation/cubit/metal_cubit.dart';
import 'package:golden_hub/features/home/presentation/cubit/metal_state.dart';

class MetalViewBody extends StatefulWidget {
  const MetalViewBody({super.key, required this.metalModel});
  final MetalModel metalModel;

  @override
  State<MetalViewBody> createState() => _MetalViewBodyState();
}

class _MetalViewBodyState extends State<MetalViewBody> {
  @override
  initState() {
    context.read<MetalCubit>().getMetalHistory(
      metalType: widget.metalModel.name == "Gold"
          ? MetalType.gold
          : MetalType.silver,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '${widget.metalModel.price.toString()} \$',
            style: TextStyle(
              fontSize: 24,
              color: widget.metalModel.name == "Gold"
                  ? AppColors.goldColor
                  : AppColors.silverColor,
            ),
          ),
          BlocBuilder<MetalCubit, MetalState>(
            builder: (context, state) {
              if (state is MetalError) {
                return Center(child: Text(state.message));
              }
              if (state is MetalHistoryLoaded) {
                final history = state.historyMetal;

                final spots = history.asMap().entries.map((e) {
                  final y = double.tryParse(e.value.maxPrice ?? "0") ?? 0.0;
                  return FlSpot(e.key.toDouble(), y);
                }).toList();

                return SizedBox(
                  height: 250,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: true),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              final index = value.toInt();
                              if (index < 0 || index >= history.length) {
                                return const SizedBox();
                              }
                              return Text(
                                DateTime.parse(
                                  history[index].day.toString(),
                                ).day.toString(),

                                style: const TextStyle(fontSize: 10),
                              );
                            },
                            reservedSize: 30,
                          ),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: spots,
                          isCurved: true,
                          gradient: const LinearGradient(
                            colors: [Colors.amber, Colors.deepOrange],
                          ),
                          barWidth: 3,
                          dotData: FlDotData(show: true),
                        ),
                      ],
                      lineTouchData: LineTouchData(
                        handleBuiltInTouches: true,
                        touchTooltipData: LineTouchTooltipData(),
                      ),
                    ),
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
