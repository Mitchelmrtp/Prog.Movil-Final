import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeapp/pages/favorite/favorite_controller.dart';
import 'package:timeapp/pages/widgets/constants.dart';
import '../../configs/constants.dart';

class FavoritePage extends StatelessWidget {
  final FavoriteController controller = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      appBar: AppBar(
        backgroundColor: kcontentColor,
        centerTitle: true,
        title: const Text(
          "Mis Favoritos",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      body: Obx(() => ListView.separated(
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          final item = controller.favoritos[index];
          return Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                        height: 85,
                        width: 85,
                        decoration: BoxDecoration(
                          color: kcontentColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Image.network(
                          '$BASE_URL${item.image}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "\$${item.price}",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: () {
                    controller.removeFromFavorites(item);
                  },
                  icon: const Icon(
                    Icons.restore_from_trash_outlined,
                    color: Colors.red,
                    size: 20,
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: controller.favoritos.length,
      )),
    );
  }
}
