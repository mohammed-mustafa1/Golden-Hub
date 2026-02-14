import 'package:flutter/material.dart';
import 'package:golden_hub/features/home/data/models/metal_model.dart';
import 'package:golden_hub/features/home/presentation/widgets/metal_view_body.dart';

class MetalView extends StatelessWidget {
  const MetalView({super.key, required this.metalModel});
  final MetalModel metalModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(metalModel.name ?? '')),
      body: MetalViewBody(metalModel: metalModel),
    );
  }
}
