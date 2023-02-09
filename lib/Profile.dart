import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFFFF8EA),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xFFFFF8EA),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 CircleAvatar(
                   radius: 90.0,
                   backgroundImage: AssetImage('asset/images/des.jpg'),
                 ),

               ],
             ), // profile photo
              SizedBox( height: 20.0,),
              const Text(
                'Desooky', //user name
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const Text(
                'ahmeddesoky@gmail.com', // email
                style: TextStyle(fontStyle:FontStyle.italic, fontSize: 15),
              ),
              SizedBox(height: 20.0,),
              Container(
                width: double.infinity,
                height: 60.0,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF734F35)),
                    onPressed: () {
                    //   Navigator.pushNamed(context, '');
                    },
                    child: const Text('Edit Profile ',style: TextStyle(color: Colors.white),)),
              ),
              SizedBox(height:20.0),
              Container(
                width: double.infinity,
                height: 60.0,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF734F35)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                    child: const Text('Settings',style: TextStyle(color: Colors.white),)),
              ),
              SizedBox(height:20.0),
              Container(
                width: double.infinity,
                height: 60.0,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF734F35)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/Pay');
                    },
                    child: const Text('Orders',style: TextStyle(color: Colors.white),)),
              ),
              SizedBox(height:50.0),
              Container(
                width: double.infinity,
                height: 60.0,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF734F35)),
                    onPressed: () {
                       Navigator.pushNamed(context, '/');
                    },
                    child: const Text('Logout',style: TextStyle(color: Colors.white),)),
              ),
            ],
          ),


        ),
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
          onTap: _onItemTapped,
        ),

      ),






    );
  }
}
