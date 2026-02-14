import 'package:flutter/material.dart';
import 'package:golden_hub/core/constants/app_colors.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.icon,
    required this.price,
  });
  final String text;
  final Color color;
  final Color textColor;
  final IconData icon;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 170,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  fontSize: 24,
                ),
              ),
              Text(
                '$price \$',
                style: TextStyle(
                  color: textColor,
                  fontSize: 24,

                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Icon(icon, color: AppColors.blackColor, size: 48),
        ],
      ),
    );
  }
}
