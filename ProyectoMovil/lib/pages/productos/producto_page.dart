import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configs/constants.dart';
import 'producto_controller.dart';
import '../favorite/favorite_controller.dart';
import '../carrito/carrito_controller.dart'; // Importa el controlador del carrito

class ProductPage extends StatelessWidget {
  final ProductoController controller = Get.put(ProductoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Relojes en Oferta'),
      ),
      body: Obx(() {
        if (controller.productos.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 columnas
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemCount: controller.productos.length,
            itemBuilder: (context, index) {
              return ProductGrid(product: controller.productos[index]);
            },
          );
        }
      }),
    );
  }
}

class ProductGrid extends StatelessWidget {
  final Product product;

  const ProductGrid({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductoController productoController = Get.find();
    final FavoriteController favoriteController = Get.put(FavoriteController());
    final CarritoController carritoController = Get.put(CarritoController());

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductGridPrueba(product: product),
          ),
        );
      },
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 100,
          ),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      child: Image.network(
                        '$BASE_URL${product.image}',
                        fit: BoxFit.cover,
                        height: 100,
                        
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            product.title,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '\$${product.price}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 133, 114, 114),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          product.isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: product.isFavorite ? Colors.red : Colors.white,
                        ),
                        onPressed: () {
                          productoController.toggleFavorite(product.id);
                          if (product.isFavorite) {
                            favoriteController.addToFavorites(product);
                          } else {
                            favoriteController.removeFromFavorites(product);
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 133, 114, 114),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          carritoController.addToCart(product);
                          Get.snackbar('Producto añadido', '${product.title} ha sido añadido al carrito.');
                        },
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductGridPrueba extends StatelessWidget {
  final Product product;
  final CarritoController carritoController = Get.put(CarritoController()); // Instancia del controlador del carrito

  ProductGridPrueba({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 20,
        ),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.network(
                  '$BASE_URL${product.image}',
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '\$${product.price}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 40,
                        columns: [
                          DataColumn(label: Text('Atributo')),
                          DataColumn(label: Text('Valor')),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text('Descripción')),
                            DataCell(
                              ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: 200, maxHeight: 900),
                                child: Text(
                                  product.description,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('')),
                            DataCell(Text('')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Categoría')),
                            DataCell(Text(product.categoryId.toString())),
                          ]),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        carritoController.addToCart(product); // Agregar al carrito
                        Get.snackbar('Producto añadido', '${product.title} ha sido añadido al carrito.');
                      },
                      child: Text('Agregar al carrito'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
