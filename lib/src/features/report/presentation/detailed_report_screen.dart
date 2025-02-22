import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/detailed_view.dart';
import 'package:yanmii_wallet/src/utils/extensions/datetime_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';

class DetailedReportScreen extends ConsumerWidget {
  const DetailedReportScreen(this.month, {super.key});

  final DateTime month;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail ${month.toMmmYyyy}'.hardcoded)),
      body: DetailedView(month),
    );
  }
}
