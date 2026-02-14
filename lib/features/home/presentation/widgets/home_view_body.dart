import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:golden_hub/core/components/main_card.dart';
import 'package:golden_hub/core/constants/app_colors.dart';
import 'package:golden_hub/core/constants/app_strings.dart';
import 'package:golden_hub/core/utils/app_routers.dart';
import 'package:golden_hub/features/home/presentation/cubit/metal_cubit.dart';
import 'package:golden_hub/features/home/presentation/cubit/metal_state.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BlocBuilder<MetalCubit, MetalState>(
        builder: (context, state) {
          if (state is MetalError) {
            return Center(child: Text(state.message));
          }
          if (state is MetalLoaded) {
            var cubit = context.read<MetalCubit>();
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    GoRouter.of(
                      context,
                    ).push(AppRoutes.gold, extra: cubit.goldMetal);
                  },
                  child: MainCard(
                    text: AppStrings.goldTextButton,
                    color: AppColors.goldColor,
                    textColor: AppColors.blackColor,
                    icon: Icons.military_tech,
                    price: cubit.goldMetal.price.toString(),
                  ),
                ),
                Gap(16),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(
                      context,
                    ).push(AppRoutes.gold, extra: cubit.silverMetal);
                  },
                  child: MainCard(
                    text: AppStrings.silverTextButton,
                    color: AppColors.silverColor,
                    textColor: AppColors.blackColor,
                    icon: Icons.toll_outlined,
                    price: cubit.silverMetal.price.toString(),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
