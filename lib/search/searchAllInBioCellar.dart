import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/model/universal_lab_provider.dart';
import 'package:universal_lab/package/text_style.dart';
import 'search_data_provider.dart';

class SearchAllInBioCellar extends SearchDelegate<SearchData?> {
final  Provide provide;
  SearchAllInBioCellar(this.provide) : super(searchFieldLabel: "Search ...");

  SearchDataProvider searchDataProvider = SearchDataProvider();

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 4,
        backgroundColor: Colors.white,
        shadowColor: Colors.yellowAccent,
        iconTheme: IconThemeData(color: kDBlue),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        counterStyle: stl1(13, null, null),
        fillColor: Colors.grey[200],
        filled: true,
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 12, 10),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () => query = "",
          icon: const FaIcon(FontAwesomeIcons.arrowsRotate))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const FaIcon(FontAwesomeIcons.arrowLeft));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<SearchData> searchData = searchDataProvider.setSearchData(provide);

    List<SearchData> searchResult = searchData
        .where((element) => (element.name).toLowerCase().contains(query))
        .toList();
    return searchResult.isEmpty
        ? const SizedBox(child: Center(child: Text("Nothing found!")))
        : searchDataProvider.searchTile(searchResult, onTap: (result) {
            close(context, result);
          });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<SearchData> searchData = searchDataProvider.setSearchData(provide);
    List<SearchData> searchResult = searchData
        .where((element) => element.name.toLowerCase().contains(query))
        .toList();
    return searchResult.isEmpty
        ? const SizedBox(child: Center(child: Text("Nothing found!")))
        : searchDataProvider.searchTile(
            searchResult,
            onTap: (result) {
              close(context, result);
            },
          );
  }

  @override
  void showSuggestions(BuildContext context) {
    // TODO: work later;
  }
}
