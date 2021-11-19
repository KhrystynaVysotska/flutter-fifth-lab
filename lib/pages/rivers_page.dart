import 'package:flutter/material.dart';
import 'package:river_water_level/models/river.dart';
import 'package:river_water_level/widgets/common/page_header.dart';
import 'package:river_water_level/widgets/measurements/latest_measurements_section.dart';
import 'package:river_water_level/widgets/rivers/rivers_list.dart';

class RiversPage extends StatelessWidget {
  const RiversPage({Key? key, required this.rivers}) : super(key: key);

  final bool _snap = false;
  final bool _pinned = false;
  final bool _floating = true;

  final List<River> rivers;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          snap: _snap,
          pinned: _pinned,
          floating: _floating,
          expandedHeight: 160.0,
          backgroundColor: Theme.of(context).primaryColor,
          flexibleSpace: const FlexibleSpaceBar(
            background: LatestMeasurementsSection(),
          ),
        ),
        const SliverToBoxAdapter(child: PageHeader(header: 'Оберіть річку:')),
        RiversList(rivers: rivers),
      ],
    );
  }
}
