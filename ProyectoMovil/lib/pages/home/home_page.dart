import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeapp/pages/carrito/carrito_page.dart';
import 'package:timeapp/pages/favorite/favorite_page.dart';
import 'package:timeapp/pages/inicio/inicio_page.dart';
import 'package:timeapp/pages/template/template_controller.dart';
import '../account/account_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TemplateController control = Get.put(TemplateController());

  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    InicioPage(),
    AccountPage(),
    FavoritePage(),
    CarritoPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Text('Home Page'),
    );
  }

  Widget _navigationBottom() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Mi cuenta',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favoritos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Relojes',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0XFF31A062),
      unselectedItemColor: Color.fromARGB(255, 142, 142, 142),
      selectedLabelStyle: TextStyle(color: Colors.black),
      unselectedLabelStyle: TextStyle(color: Colors.grey),
      onTap: _onItemTapped,
      backgroundColor: Color.fromARGB(255, 236, 233, 233),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bienvenido...!!!',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        leading: IconButton(
          onPressed: () {
            Get.to(() => CarritoPage());
          },
          icon: const Icon(Icons.shopping_cart),
          color: Color.fromARGB(255, 255, 255, 255),
        ),
       
        shape: const RoundedRectangleBorder(),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: _navigationBottom(),
      backgroundColor: Color.fromARGB(255, 236, 233, 233),
    );
  }
}

