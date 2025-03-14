import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/detailed_view.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/per_category_recap/per_category_recap_view.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/per_title_recap/per_title_recap_view.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/summary_view.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/summary_view_controller.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';

class DetailedReportScreen extends ConsumerStatefulWidget {
  const DetailedReportScreen({
    required this.startDate,
    required this.endDate,
    super.key,
  });

  final DateTime startDate;
  final DateTime endDate;

  @override
  ConsumerState<DetailedReportScreen> createState() =>
      _DetailedReportScreenState();
}

class _DetailedReportScreenState extends ConsumerState<DetailedReportScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    Future.delayed(Duration.zero, () {
      ref.read(summaryViewControllerProvider.notifier).getSummary(
            startDate: widget.startDate,
            endDate: widget.endDate,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text('Detail Recap'.hardcoded),
              pinned: true,
              floating: true,
            ),
            SliverToBoxAdapter(
              child: SummaryView(
                startDate: widget.startDate,
                endDate: widget.endDate,
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: _controller,
                  tabs: [
                    Tab(text: 'Grafik'.hardcoded),
                    Tab(text: 'Per Judul'.hardcoded),
                    Tab(text: 'Per Kategori'.hardcoded),
                  ],
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: _controller,
          children: [
            DetailedView(widget.startDate),
            PerTitleRecapView(startDate: widget.startDate),
            PerCategoryRecapView(startDate: widget.startDate),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
