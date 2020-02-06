import 'package:flutter/material.dart';
import 'package:theafricatour/common/icons.dart';
import 'package:theafricatour/common/stub_data.dart';
import 'package:theafricatour/common/theme.dart';
import 'package:theafricatour/parallax_page_view.dart';

class BottomSheetContent extends StatelessWidget {
  final AnimationController controller;

  BottomSheetContent({this.controller});

  @override
  Widget build(BuildContext context) {
    final themeData = HotelConceptThemeProvider.get();
    final double topPaddingMax = 44;
    final double topPaddingMin = MediaQuery.of(context).padding.top;
    double topMarginAnimatedValue = (1 - controller.value) * topPaddingMax * 2;
    double topMarginUpdatedValue = topMarginAnimatedValue <= topPaddingMin ? topPaddingMin : topMarginAnimatedValue;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      child: Padding(
        padding:  EdgeInsets.only(top: topMarginUpdatedValue),
        child: LayoutBuilder(
          builder: (context, constraints) {

            return ScrollConfiguration(
              behavior: OverScrollBehavior(),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "",
                                style: TextStyle(
                                    color: themeData.primaryColorLight, fontSize: 24),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      HotelBookingConcept.ic_star,
                                      size: 15,
                                      color: themeData.disabledColor,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      "5.0",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: themeData.disabledColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: <Widget>[
                              Icon(
                                HotelBookingConcept.ic_location,
                                size: 20,
                                color: themeData.textTheme.display3.color,
                              ),
                              const SizedBox(width: 5),
                              Text(""),
                            ],
                          ),
                          const SizedBox(height: 18),
                          Text(
                            "DETAILS",
                            style: TextStyle(letterSpacing: 1),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "The features over 1,0000 luxuriously appointed, individually styled rooms, suites and apartments, each containing unique works of art. Accommodation at the hotel includes air conditioning in all the rooms, private bathroom with heated mirrors, hair dryer, power shower, BT Openzone Wi-Fi, coffee and tea making facilities, complimentary toiletries, Egyptian linen, flat Screen LCD TV with free view, work desk, 24 hour room service",
                            style: TextStyle(height: 1.4),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "FACILITIES",
                            style: TextStyle(letterSpacing: 1),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: StubData().facilities,
                          ),
                          const SizedBox(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "CHECK IN",
                                    style: TextStyle(letterSpacing: 1),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "14:00 AM",
                                    style: themeData.textTheme.display1,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "CHECK OUT",
                                    style: TextStyle(letterSpacing: 1),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "12:00 AM",
                                    style: themeData.textTheme.display1,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 68),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
