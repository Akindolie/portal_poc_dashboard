import 'package:flutter/material.dart';

class DataTableDemo extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(5),
      children: [
        PaginatedDataTable(
          //header: Text(''),
          headingRowHeight: 0,
          rowsPerPage: 4,
          columns: [
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
          ],
          source: _DataSource(context),
          showCheckboxColumn: false,
        ),
      ],
    );
  }
}

class _Row {
  _Row(
    this.valueA,
    this.valueB,
    this.valueC,
    this.valueD,
  );

  final String valueA;
  final String valueB;
  final String valueC;
  final String valueD;

  bool selected = false;
}

class _DataSource extends DataTableSource {
  _DataSource(this.context) {
    _rows = <_Row>[
      _Row('000000450002', 'CUSTOMER ACCOUNT', 'NGN', '57,302.62'),
      _Row('EQT000045001', 'EQUITY FUND', 'NGN', '0.00'),
      _Row('IDF0000450003	', 'INDIVIDUAL FUNDS', 'NGN', '100,000.00'),
      _Row('LNF0000450002', 'Loan Cash Account - Flat', 'NGN', '0.00'),
      _Row('MMF000045001	', 'GDL MONEY MARKET FUND', 'NGN', '360,006.19'),
      _Row('TBF000045001', 'Test Balance Fund', 'NGN', '9,500,000.00'),
    ];
  }

  final BuildContext context;
  List<_Row> _rows;

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _rows.length) return null;
    final row = _rows[index];
    return DataRow.byIndex(
      //color: MaterialStateProperty.all<Color>(Colors.white.withOpacity(0.01)),
      index: index,
      selected: row.selected,
      onSelectChanged: (value) {
        if (row.selected != value) {
          _selectedCount += value ? 1 : -1;
          assert(_selectedCount >= 0);
          row.selected = value;
          notifyListeners();
        }
      },
      cells: [
        DataCell(Text(
          row.valueA,
          style: TextStyle(fontSize: 13),
        )),
        DataCell(Text(row.valueB, style: TextStyle(fontSize: 12))),
        DataCell(Text(row.valueC, style: TextStyle(fontSize: 12))),
        DataCell(Text(row.valueD, style: TextStyle(fontSize: 12))),
      ],
    );
  }

  @override
  int get rowCount => _rows.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
