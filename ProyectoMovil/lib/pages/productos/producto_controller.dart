import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Modelo de Producto
class Product {
  final int id;
  final String title;
  final String image;
  final double price;
  final String description;
  final int categoryId;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    required this.categoryId,
    this.isFavorite = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'price': price,
      'description': description,
      'categoryId': categoryId,
      'isFavorite': isFavorite,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      price: json['price'],
      description: json['description'],
      categoryId: json['categoryId'],
      isFavorite: json['isFavorite'],
    );
  }
}

class ProductoController extends GetxController {
  RxList<Product> productos = <Product>[].obs;
  RxList<Product> filteredProducts = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProductos();
  }

  Future<void> fetchProductos() async {
    var url = Uri.parse('http://192.168.18.35:4912/producto/list');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      List<Product> tempList = [];

      jsonResponse.forEach((product) {
        tempList.add(Product(
          id: product['id'],
          title: product['name'],
          image: product['image_url'],
          price: double.parse(product['precio'].toString()),
          description: product['description'],
          categoryId: product['categorys_id'],
        ));
      });

      productos.assignAll(tempList);
      filteredProducts.assignAll(tempList);  // Initially, all products are shown
    } else {
      print('Error al obtener productos: ${response.statusCode}');
    }
  }

  void toggleFavorite(int productId) {
    int index = productos.indexWhere((product) => product.id == productId);
    if (index != -1) {
      productos[index].isFavorite = !productos[index].isFavorite;
      productos.refresh();
    }
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      filteredProducts.assignAll(productos);
    } else {
      filteredProducts.assignAll(
        productos.where((product) => product.title.toLowerCase().contains(query.toLowerCase())).toList(),
      );
    }
  }
}
