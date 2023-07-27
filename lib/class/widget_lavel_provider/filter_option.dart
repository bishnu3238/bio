import 'package:flutter/foundation.dart';
import 'package:universal_lab/class/enums.dart';

class FilterOption {
  final ItemSearchType searchType;
  final List<Map> values;
  final ValueNotifier<List<String>> selectedValues;

  FilterOption({
    required this.searchType,
    required this.values,
    required List<String> initialSelectedValues,
  }) : selectedValues = ValueNotifier<List<String>>(initialSelectedValues);


}


