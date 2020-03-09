import 'package:flutter/material.dart';

class StaticDataTable extends StatefulWidget {
  @override
  _StaticDataTableState createState() => _StaticDataTableState();
}

class _StaticDataTableState extends State<StaticDataTable> {
  _getRows() {
    return [
      DataRow(
        selected: true,
        cells: [
          DataCell(Text('Amit'), onTap: () {}, showEditIcon: true),
          DataCell(Text('999999'))
        ],
      ),
      DataRow(cells: [
        DataCell(Text('Ram'), onTap: () {}, showEditIcon: true),
        DataCell(Text('44444'))
      ])
    ];
  }

  _getColumns() {
    return [
      DataColumn(
          label: Text('Name'), tooltip: String.fromEnvironment("Name column")),
      DataColumn(label: Text('Salary'), numeric: true)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: DataTable(
              sortAscending: true,
              sortColumnIndex: 0,
              columns: _getColumns(),
              rows: _getRows()),
        ),
      )),
    );
  }
}
