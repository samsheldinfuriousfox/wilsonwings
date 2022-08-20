import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wilsonwings/components/custom_text_field.dart';
import 'package:wilsonwings/components/data_container.dart';
import 'package:wilsonwings/components/progress_indicator.dart';
import 'package:wilsonwings/components/svg_image.dart';
import 'package:wilsonwings/home_screen/home_controller.dart';
import 'package:wilsonwings/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*   appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: context.width,
        leading: Row(
          children: [
            const SizedBox(width: 20),
            Image.asset("assets/images/pic.png"),
            const SizedBox(width: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "SayeedAfzal",
                  style: Get.textTheme.subtitle2,
                ),
                Text(
                  "State Head",
                  style: Get.textTheme.subtitle2
                      ?.copyWith(color: Appcolors.darkGrey),
                ),
              ],
            )
          ],
        ),
        toolbarHeight: 60,
        actions: [
          DataContainer(
            Image.asset("assets/images/notifications.png"),
            paddingValue: 5,
            width: 50,
            marginValue: 20,
          ),
          const SizedBox(width: 10),
          //SvgImage("notifications")
        ],
      ), */
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Image.asset("assets/images/pic.png"),
                  const SizedBox(width: 5),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SayeedAfzal",
                        style: Get.textTheme.subtitle2,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "State Head",
                        style: Get.textTheme.subtitle2
                            ?.copyWith(color: Appcolors.darkGrey),
                      ),
                    ],
                  ),
                  const Spacer(),
                  DataContainer(
                    Image.asset("assets/images/notifications.png"),
                    paddingValue: 5,
                    width: 50,
                    marginValue: 20,
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            Expanded(
              child: GetBuilder<HomeController>(builder: (_) {
                return ListView(children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      colors: [Appcolors.blue1, Appcolors.blue1],
                      begin: FractionalOffset.centerLeft,
                      end: FractionalOffset.centerRight,
                    )),
                    child: TextFieldType1(TextEditingController(),
                        hintText: "Search report by name, pincode, ID",
                        prefixIcon: Image.asset("assets/images/search.png")),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Karnataka Reports",
                    style: Get.textTheme.headline5?.copyWith(
                        fontWeight: FontWeight.w600, color: Appcolors.black1),
                  ).marginSymmetric(horizontal: 20),
                  const Divider().marginSymmetric(horizontal: 20),
                  const TitleDateWidget("Onboarding", "Mar 8"),
                  DataContainer(
                    Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Users",
                            style: Get.textTheme.headline5
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                          Text("Achived/Traget",
                              style: Get.textTheme.subtitle2),
                        ],
                      ),
                      for (int i = 0; i < _.onBoardList.length; i++)
                        Column(
                          children: [
                            const SizedBox(height: 28),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(_.onBoardList[i].title,
                                    style: Get.textTheme.subtitle1),
                                Text(
                                  "${_.onBoardList[i].value}/${_.onBoardList[i].total}",
                                  style: Get.textTheme.headline5
                                      ?.copyWith(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(height: 13.5),
                            CustomProgressIndicator(
                                _.onBoardList[i].value / _.onBoardList[i].total)
                          ],
                        )
                    ]),
                  ),
                  DataContainer(
                    Column(
                      children: [
                        Stack(
                          children: [
                            SfCartesianChart(
                                //title: ChartTitle(text: 'Yearly sales analysis'),
                                legend: Legend(isVisible: false),
                                tooltipBehavior: TooltipBehavior(enable: true),
                                series: <ChartSeries>[
                                  AreaSeries<SalesData, double>(
                                      name: 'Sales',
                                      dataSource: _.getChartData2(),
                                      color: Appcolors.green,
                                      xValueMapper: (SalesData sales, _) =>
                                          sales.value,
                                      yValueMapper: (SalesData sales, _) =>
                                          sales.sales,
                                      dataLabelSettings:
                                          const DataLabelSettings(
                                              isVisible: false),
                                      enableTooltip: true),
                                  AreaSeries<SalesData, double>(
                                      name: 'Sales',
                                      dataSource: _.getChartData(),
                                      color: Appcolors.blue1,
                                      xValueMapper: (SalesData sales, _) =>
                                          sales.value,
                                      yValueMapper: (SalesData sales, _) =>
                                          sales.sales,
                                      dataLabelSettings:
                                          const DataLabelSettings(
                                              isVisible: false),
                                      enableTooltip: true),
                                ],
                                primaryXAxis: NumericAxis(
                                    edgeLabelPlacement:
                                        EdgeLabelPlacement.shift,
                                    labelFormat: 'Mar {value}'),
                                primaryYAxis: NumericAxis(
                                  labelFormat: '₹{value}k',
                                )
                                //  numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
                                ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: context.width / 3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: Appcolors.blue2),
                                    color: Colors.white),
                                child: Column(children: [
                                  const Text("March 17")
                                      .marginOnly(left: 3, right: 3, top: 3),
                                  const Divider(
                                    thickness: 1,
                                    color: Appcolors.blue2,
                                  ),
                                  const Text("31.4% vs 48.4%")
                                      .marginOnly(left: 3, right: 3, bottom: 3)
                                ]),
                              ),
                            )
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            ChartDescription(Appcolors.green, "LMTD (31.4%)"),
                            ChartDescription(Appcolors.blue1, "MTD (48.7%)"),
                          ],
                        )
                      ],
                    ),
                  ),
                  const TitleDateWidget("LMTD v/s MTD", "8 Mar - 23 Mar"),
                  DataContainer(Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("LMTD", style: Get.textTheme.bodyText1),
                          Text("Products", style: Get.textTheme.subtitle1),
                          Text("MTD", style: Get.textTheme.bodyText1),
                        ],
                      ),
                      for (int i = 0; i < _.productWiseList.length; i++)
                        Column(
                          children: [
                            const SizedBox(height: 28),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${_.productWiseList[i].value}%",
                                      style: Get.textTheme.bodyText1),
                                  Text(_.productWiseList[i].title,
                                      style: Get.textTheme.subtitle2),
                                  Text("${_.productWiseList[i].total}%",
                                      style: Get.textTheme.bodyText1),
                                ]),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomProgressIndicator(
                                      _.productWiseList[i].value / 100,
                                      backgroundColor: Appcolors.red,
                                      colorValue: Appcolors.lightPurpule),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: CustomProgressIndicator(
                                      _.productWiseList[i].total / 100,
                                      colorValue: Appcolors.blue1),
                                )
                              ],
                            ),
                            const SizedBox(height: 13.5),
                          ],
                        )
                    ],
                  ))
                ]);
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TabItem("home", "Home"),
                TabItem("team", "Team"),
                TabItem("reports", "Reports"),
                TabItem("tick", "Attendance"),
              ],
            ).paddingAll(15)
          ],
        ),
      ),
    );
  }
}

class ChartDescription extends StatelessWidget {
  final Color color;
  final String text;
  const ChartDescription(
    this.color,
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 12,
          width: 12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: color),
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: Get.textTheme.subtitle2,
        )
      ],
    );
  }
}

class TitleDateWidget extends StatelessWidget {
  final String title, date;

  const TitleDateWidget(
    this.title,
    this.date, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Get.textTheme.subtitle1,
        ),
        DateWidget(date)
      ],
    ).marginSymmetric(horizontal: 20);
  }
}

class DateWidget extends StatelessWidget {
  final String date;
  const DateWidget(
    this.date, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Appcolors.blue1)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            date,
            style: Get.textTheme.subtitle2?.copyWith(color: Appcolors.blue1),
          ),
          const SizedBox(width: 5),
          const SvgImage("chevron-circle-down-alt")
        ],
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String imageText, tite;
  const TabItem(this.imageText, this.tite, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/$imageText.png"),
        const SizedBox(width: 10),
        Text(tite, style: Get.textTheme.subtitle2)
      ],
    );
  }
}
