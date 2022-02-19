import 'package:http/http.dart' as http;
import 'package:store/products/data/product_model.dart';

class ProductService {
  static http.Client client = http.Client();

  Future<List<Product>> getProducts() async {
    final response = await client.get(
      Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'),
    );

    if (response.statusCode == 200) {
      return productFromJson(response.body);
    } else {
      print("failure reason: " + response.reasonPhrase.toString());
      throw Exception('Failed to load products');
    }
  }
}
