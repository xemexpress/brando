import 'package:brando/src/features/home/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TableHeaderCell extends StatelessWidget {
  const TableHeaderCell({
    super.key,
    required this.child,
  });

  final dynamic child;

  @override
  Widget build(BuildContext context) {
    return TableRowCell(isHeader: true, child: child);
  }
}
