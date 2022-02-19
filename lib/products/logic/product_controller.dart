import 'package:get/get.dart';
import 'package:store/products/data/product_model.dart';
import 'package:store/products/data/product_service.dart';

class ProductController extends GetxController with StateMixin<List<Product>> {
  final ProductService productService = ProductService();
  Rx<List<Product>> products = Rx<List<Product>>([]);

  void fetchProducts() async {
    change(null, status: RxStatus.loading());
    try {
      products.value = await productService.getProducts();
      if (products.value.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(products.value, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }
}
