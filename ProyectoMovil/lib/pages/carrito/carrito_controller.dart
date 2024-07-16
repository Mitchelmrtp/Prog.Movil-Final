import 'package:get/get.dart';
import 'package:timeapp/pages/productos/producto_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

// Modelo del Carrito
class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'quantity': quantity,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: Product.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }
}

class CarritoController extends GetxController {
  RxList<CartItem> carrito = <CartItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCart();
  }

  void addToCart(Product product) {
    int index = carrito.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      carrito[index].quantity++;
    } else {
      carrito.add(CartItem(product: product));
    }
    saveCart();
    carrito.refresh();
  }

  void removeFromCart(Product product) {
    int index = carrito.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      if (carrito[index].quantity > 1) {
        carrito[index].quantity--;
      } else {
        carrito.removeAt(index);
      }
      saveCart();
      carrito.refresh();
    }
  }

  void saveCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartItems = carrito.map((item) => json.encode(item.toJson())).toList();
    await prefs.setStringList('cart', cartItems);
  }

  void loadCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartItems = prefs.getStringList('cart');
    if (cartItems != null) {
      carrito.value = cartItems.map((item) => CartItem.fromJson(json.decode(item))).toList();
    }
  }
}
