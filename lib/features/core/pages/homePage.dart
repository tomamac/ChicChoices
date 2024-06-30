import 'package:chic_choices/1main_pages/add_flight_page.dart';
import 'package:chic_choices/1main_pages/home_page.dart';
import 'package:chic_choices/features/core/pages/bookingPage.dart';
import 'package:chic_choices/reuse/reuse_widgets.dart';
import 'package:chic_choices/states/core/homepage_state.dart';
import 'package:chic_choices/states/core/mainpage_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';

class homePage extends StatelessWidget {
  const homePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final PagesState = Get.put(MainPageState());
    final _state = Get.put(HomepageState());
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: screensizeWithBottom(context),
          color: const Color(0xFFF6C273),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              hive(1),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: logoWidget(
                  285,
                  285,
                ),
              ),
              GestureDetector(
                onTap: () {
                  PagesState.setPage(1);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 100,
                    child: ImageSlideshow(
                      initialPage: 0,
                      indicatorColor: Colors.blue,
                      indicatorBackgroundColor: Colors.grey,
                      //Auto Scroll interval
                      //Do not auto scroll with null or 0
                      autoPlayInterval: 6000,
                      //Loops back to first slide
                      isLoop: true,
                      children: [
                        Image.asset(
                          'images/pro1resp.png',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'images/pro2resp.jpg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'images/pro3resp.jpg',
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return _state.cities
                      .where((city) => city.contains(textEditingValue.text))
                      .toList();
                },
                onSelected: (String value) {
                  _state.selectedCity.value = value;
                },
                fieldViewBuilder: (BuildContext context,
                    TextEditingController textEditingController,
                    FocusNode focusNode,
                    VoidCallback onFieldSubmitted) {
                  return Container(
                      width: LRPadding(context),
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'ค้นหาเส้นทาง',
                          prefixIcon: Icon(Icons.search),
                        ),
                        controller: textEditingController,
                        focusNode: focusNode,
                        onFieldSubmitted: (String value) {
                          onFieldSubmitted();
                          // You can also handle text submission here.
                          // For demonstration, we just print the value to the console.
                          // switch (value) {
                          //   case 'กรุงเทพ':
                          Future.delayed(
                            const Duration(milliseconds: 500),
                            () => Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration:
                                    const Duration(milliseconds: 500),
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        HomePage(
                                  routeTransitionValue: animation,
                                ),
                              ),
                            ),
                          );
                          //     case 'ภูเก็ต':
                          //       Get.to(const bookingPage());
                          //   }
                          //   Get.to(const bookingPage());
                          // },
                        },
                      ));
                },
              ),
              Container(
                width: LRPadding(context),
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TopIconButton(Icons.flight, 'เครื่องบิน', true, context),
                    TopIconButton(
                        Icons.directions_bus, 'รถทัวร์', false, context),
                    TopIconButton(Icons.train, 'รถไฟ', false, context),
                  ],
                ),
              ),
              hive(2),
            ],
          ),
        ),
      ),
    );
  }
}
