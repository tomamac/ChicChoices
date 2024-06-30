import 'package:chic_choices/1utils/hard_coded_data.dart';
import 'package:chic_choices/1widgets/fading_item_list/fading_item_list.dart';
import 'package:chic_choices/1widgets/fading_item_list/fading_item_list_controller.dart';
import 'package:chic_choices/1widgets/flights_list_item_widget.dart';
import 'package:flutter/material.dart';

class MyFlightsListPage extends StatelessWidget {
  final FadingItemListController fadingItemListController;
  const MyFlightsListPage({
    super.key,
    required this.fadingItemListController,
  });

  @override
  Widget build(BuildContext context) => FadingItemList(
        fadingItemListController: fadingItemListController,
        listItems: List.generate(
          5,
          (index) => FlightsListItemWidget(
            flightData: HardCodedData.myFlightsData[index],
          ),
        ),
      );
}
