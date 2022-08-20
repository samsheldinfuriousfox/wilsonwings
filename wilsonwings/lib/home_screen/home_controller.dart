import 'package:get/get.dart';

class HomeController extends GetxController {
  List<OnBoardingData> onBoardList = [
    OnBoardingData("Master Distributor", 20, 50),
    OnBoardingData("Distributor", 54, 75),
    OnBoardingData("Agent", 175, 250),
  ];
  List<OnBoardingData> productWiseList = [
    OnBoardingData("DMT", 45, 55),
    OnBoardingData("MATM", 15, 4),
    OnBoardingData("Banking", 65, 12),
    OnBoardingData("BBPS", 12, 48)
  ];
  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(8, 5),
      SalesData(10, 6),
      SalesData(13, 15),
      SalesData(20, 9),
      SalesData(23, 8),
      SalesData(30, 5)
    ];
    return chartData;
  }

  List<SalesData> getChartData2() {
    final List<SalesData> chartData = [
      SalesData(8, 10),
      SalesData(10, 12),
      SalesData(13, 30),
      SalesData(20, 17),
      SalesData(23, 15),
      SalesData(30, 11)
    ];
    return chartData;
  }
}

class OnBoardingData {
  String title;
  int value, total;
  OnBoardingData(this.title, this.value, this.total);
}

class SalesData {
  SalesData(this.value, this.sales);
  final double value;
  final double sales;
}
