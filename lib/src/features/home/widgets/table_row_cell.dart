import 'package:flutter/material.dart';

class TableRowCell extends StatelessWidget {
  const TableRowCell({
    super.key,
    required this.child,
    this.isHeader = false,
  });
  final double verticalPaddingForHeaderCell = 3;
  final double verticalPaddingForRowCell = 9;

  final bool isHeader;
  final dynamic child;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: isHeader
              ? verticalPaddingForHeaderCell
              : verticalPaddingForRowCell,
        ),
        child: child is String
            ? Text(
                child,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: isHeader ? FontWeight.w600 : FontWeight.normal,
                ),
              )
            : child,
      ),
    );
  }
}
