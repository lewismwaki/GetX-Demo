import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:store/products/logic/product_controller.dart';
import 'package:store/products/presentation/widgets/product_tile.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.bottomSheet(
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5, tileMode: TileMode.mirror),
                  child: Container(
                    height: Get.height * 0.8,
                    color: Colors.red,
                    child: Text("test"),
                  ),
                ),
                barrierColor: Colors.orange.withOpacity(0.2),
                enableDrag: true,
              );
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Column(
        children: [
          //title
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'ShopX',
                    style: TextStyle(
                      fontFamily: 'avenir',
                      fontSize: 23,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.view_list_rounded),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.grid_view),
                ),
              ],
            ),
          ),

          //grid view
          productController.obx(
            (data) => Expanded(
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 2,
                itemCount: productController.products.value.length,
                itemBuilder: (context, index) {
                  return ProductTile(
                    product: productController.products.value[index],
                  );
                },
              ),
            ),
            onLoading: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(),
            ),
            onEmpty: Text("empty"),
            onError: (error) => Text("error"),
          ),
        ],
      ),
    );
  }
}
