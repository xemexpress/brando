import 'package:flutter/material.dart';

class TableRowCell extends StatelessWidget {
  const TableRowCell({
    super.key,
    required this.child,
    this.isHeader = false,
    this.rightBordered = false,
  });
  final bool isHeader;
  final bool rightBordered;
  final double verticalPaddingForHeaderCell = 3;

  final dynamic child;

  @override
  Widget build(BuildContext context) {
    final Widget childWidget = child is String
        ? Text(
            child,
            textAlign: TextAlign.center,
            style: isHeader
                ? Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    )
                : Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
          )
        : child;

    return TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          decoration: rightBordered
              ? const BoxDecoration(
                  border: Border(
                    right: BorderSide(),
                  ),
                )
              : null,
          padding: isHeader
              ? EdgeInsets.symmetric(vertical: verticalPaddingForHeaderCell)
              : null,
          child: SizedBox(
            height: isHeader ? null : 35,
            child: Center(
              child: childWidget,
            ),
          ),
        ));
  }
}
