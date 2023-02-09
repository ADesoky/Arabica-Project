

import 'package:arabicaa/Cart.dart';
import 'package:arabicaa/Payment.dart';
import 'package:arabicaa/config.dart';
import 'package:arabicaa/home_body.dart';
import 'package:flutter/material.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Cart',
      style: optionStyle,
    ),
    Text(
      'Index 2: Payment',
      style: optionStyle,
    ),
  ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFFFF8EA),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xFFFFF8EA),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('arabicaa',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Color(0xFF734F35))),
              Text(
                'Hi, ${globalUserModel!.userData!.userName} ',
                style: TextStyle(color: Color(0xFF734F35), fontSize: 10),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Image.network(
                globalUserModel!.userData!.userImage!,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/Pro');
              },
            ),
          ],
        ),
        body: selectedItemFromNavBar(),
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.wallet),
                label: 'Payment',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
              selectedItemFromNavBar();
            }),
      ),
    );
  }
  Widget selectedItemFromNavBar() {

    switch (_selectedIndex) {
      case 0:
        return HomeBody();
      case 1:
        return ShopCart();
      default:
        return Payement();
    }
}




}
