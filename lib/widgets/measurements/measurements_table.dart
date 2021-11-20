import 'package:flutter/material.dart';
import 'package:river_water_level/models/measurement.dart';
import 'package:river_water_level/widgets/common/page_header.dart';

class MeasurementsTable extends StatelessWidget {
  const MeasurementsTable({Key? key, required this.measurements})
      : super(key: key);

  final List<Measurement> measurements;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const PageHeader(
          header: 'Перегляд записів:',
          hasArrowBack: true,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Час')),
              DataColumn(label: Text('Замір')),
            ],
            rows: measurements
                .map(
                  (el) => DataRow(
                    cells: <DataCell>[
                      DataCell(Text(el.id.toString())),
                      DataCell(Text(el.timestamp.split('T')[1])),
                      DataCell(Text(el.waterLevel.toString())),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
