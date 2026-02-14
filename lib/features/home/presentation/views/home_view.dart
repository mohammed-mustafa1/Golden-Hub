import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_hub/features/home/data/models/metal_model.dart';
import 'package:golden_hub/features/home/presentation/cubit/metal_cubit.dart';
import 'package:golden_hub/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MetalCubit()
          ..getMetalPrice(metalType: MetalType.gold)
          ..getMetalPrice(metalType: MetalType.silver),
        child: HomeViewBody(),
      ),
    );
  }
}
