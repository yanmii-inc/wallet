import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/detailed_view.dart';

class RealTimeView extends ConsumerWidget {
  const RealTimeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DetailedView(DateTime.now());
  }
}
