import 'package:gym_rats/models/treinos.dart';

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = true,
  });
  String expandedValue;
  String headerValue;
  bool isExpanded;
}
