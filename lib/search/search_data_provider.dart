
import 'package:flutter/material.dart';
import 'package:universal_lab/class/app_constant.dart';

import '../class/enums.dart';
import '../class/model/provider.dart';
import '../package/custom_widgets/custom_image.dart';

class SearchDataProvider {
  List<SearchData> _searchData = [];

  List<SearchData> get searchData => _searchData;

  List<SearchData> setSearchData(Provide provide) {
    return _searchData = [
      ...provide.category
          .map((e) =>
      SearchData.fromMap(e.toMap())..type = ItemSearchType.Category)
          .toList(),
      ...provide.brands
          .map(
              (e) => SearchData.fromMap(e.toMap())..type = ItemSearchType.Brand)
          .toList(),
      ...provide.items
          .map((e) => SearchData.fromMap(e.toMap())..type = ItemSearchType.Item)
          .toList(),
    ];
  }

  Widget searchTile(List<SearchData> searchResult,
      {required Null Function(dynamic result) onTap}) {
    return ListView.builder(
      itemCount: searchResult.length,
      itemBuilder: (ctx, index) {
        return ListTile(
          onTap: () => onTap(searchResult[index]),
          leading: CircleAvatar(backgroundColor: kLight,
            child: CustomImage(searchResult[index].image),
          ),
          title: Text(searchResult[index].name),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent[100],
                borderRadius: BorderRadius.circular(12)),
            child: Text((searchResult[index].type!).name),
          ),
        );
      },
    );
  }
}

class SearchData {
  final String id, name, image;
  ItemSearchType? type;

//<editor-fold desc="Data Methods">
  SearchData({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
  });

  factory SearchData.fromMap(Map<String, dynamic> map) {
    return SearchData(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      type: map['type'],
    );
  }

//</editor-fold>
}
