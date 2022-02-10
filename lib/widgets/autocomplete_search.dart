// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, deprecated_member_use

import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_kenya/controller/place_controller.dart';
import 'package:travel_kenya/pages/search/search_page.dart';

class AutoCompleteSearch extends StatefulWidget {
  @override
  _AutoCompleteSearchState createState() => _AutoCompleteSearchState();
}

class _AutoCompleteSearchState extends State<AutoCompleteSearch> {
  final placesController = Get.put(PlaceController());

  final TextEditingController _autoSearchController = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> keyController = GlobalKey();
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    _autoSearchController.addListener(() {
      setState(() {
        if (_autoSearchController.text.isNotEmpty) {
          // print('There is text');
          _showClearButton = true;
        } else {
          //print('There no no no is text');
          _showClearButton = false;
        }
      });
    });
  }

  Widget? _getClearButton() {
    return IconButton(
        onPressed: () => _autoSearchController.clear(),
        icon: Icon(Icons.clear,
            color: _showClearButton ? Colors.white : Colors.transparent));
  }

  // getClearButton(){
  //    setState(() {
  //       _showClearButton = _autoSearchController.text.length == 1;
  //     });
  // }

  @override
  Widget build(BuildContext context) {
    final places =
        placesController.places.map((e) => e.location).toSet().toList();

    return GetBuilder(
      init: PlaceController(),
      builder: (value) => Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: AutoCompleteTextField(
          controller: _autoSearchController,
          suggestions: places,
          key: keyController,
          clearOnSubmit: false,
          style: TextStyle(color: Colors.white, fontSize: 16),
          decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () => _autoSearchController.clear(),
                icon: Icon(Icons.clear,
                    color: _autoSearchController.text.isNotEmpty
                        ? Colors.white
                        : Colors.transparent)),
            //_getClearButton(),
            prefixIcon: Icon(Icons.search, color: Colors.white),
            hintStyle: TextStyle(color: Colors.white),
            hintText: 'Search Places...',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.white, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.white, width: 1),
            ),
          ),
          itemFilter: (String? item, query) {
            return item!.toLowerCase().startsWith(query.toLowerCase());
          },
          itemSorter: (String? a, String b) {
            return a!.compareTo(b);
          },
          itemSubmitted: (String item) {
            _autoSearchController.text = item;
            Get.to(
              () => SearchPage(),
              transition: Transition.fadeIn,
              arguments: {
                'title': item,
              },
            );
          },
          itemBuilder: (BuildContext context, String item) {
            return Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(item, style: TextStyle(color: Colors.black)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
