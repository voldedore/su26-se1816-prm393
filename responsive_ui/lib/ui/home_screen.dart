import 'package:flutter/material.dart';

import 'list_product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery
    // Lấy được các thông tin liên quan đến kích thước màn hình, chiều ngang/doc
    final mq = MediaQuery.of(context);
    print('Width = ${mq.size.width}');
    print('Height = ${mq.size.height}');
    print('Aspect ratio = ${mq.size.aspectRatio}');
    print('Orientation = ${mq.orientation}');

    /*************** Using MediaQuery *************/
    // 1st approach -
    // if orientaion -> portrait -> col 2
    // else -> col 3-4
    // Handle theo Orientation của device
    // if (mq.orientation == Orientation.portrait) {
    //   return ListProduct(col: 2);
    // } else {
    //   return ListProduct(col: 4);
    // }

    // Handle theo kích thước của device
    // final isWide = mq.size.width >= 500;
    // if (!isWide) {
    //   return ListProduct(col: 2);
    // } else {
    //   return ListProduct(col: 4);
    // }
    /********** LayoutBuilder ************/
    // return Scaffold(
    //   body: LayoutBuilder(builder: (context, constraints) {
    //     print('maxWidth = ${constraints.maxWidth}');
    //     if (constraints.maxWidth > 500) {
    //       return ListProduct(col: 4);
    //     }
    //     return ListProduct(col: 2);
    //   }),
    // );

    /********** OrientationBuilder ***********/
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        // if (orientation == .portrait) { // Viet tat
        if (orientation == Orientation.portrait) {
          return ListProduct(col: 2);
        } else {
          return ListProductHorizontal();
        }
      })
    );
  }
}
