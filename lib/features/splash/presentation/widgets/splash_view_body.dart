import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:golden_hub/core/constants/app_colors.dart';
import 'package:golden_hub/core/utils/app_routers.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2300), () {
      GoRouter.of(context).go(AppRoutes.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 2000),
        tween: Tween(begin: 0, end: 1),
        curve: Curves.easeOutBack,
        builder: (context, value, child) {
          return Transform.scale(scale: value, child: child);
        },
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('GOLD', style: splashTextStyle()),
              Column(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.,
                children: [
                  Text('EN', style: splashTextStyle()),

                  Container(width: 38, height: 2, color: AppColors.goldColor),
                ],
              ),
              Gap(8),
              Text('HUB', style: splashTextStyle()),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle splashTextStyle() => TextStyle(fontSize: 32, letterSpacing: 3);
}
