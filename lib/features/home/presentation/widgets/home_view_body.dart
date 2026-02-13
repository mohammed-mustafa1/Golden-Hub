import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gold_hub/core/components/main_card.dart';
import 'package:gold_hub/core/constants/app_colors.dart';
import 'package:gold_hub/core/constants/app_strings.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: MainCard(
              text: AppStrings.goldTextButton,
              color: AppColors.goldColor,
              textColor: AppColors.blackColor,
              icon: Icons.military_tech,
            ),
          ),
          Gap(16),
          GestureDetector(
            onTap: () {},
            child: MainCard(
              text: AppStrings.silverTextButton,
              color: AppColors.silverColor,
              textColor: AppColors.blackColor,
              icon: Icons.toll_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
