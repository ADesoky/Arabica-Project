import 'package:flutter/material.dart';

class Donuts extends StatefulWidget {
  const Donuts({Key? key}) : super(key: key);

  @override
  State<Donuts> createState() => _DonutsState();
}

class _DonutsState extends State<Donuts> {
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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFFFF8EA),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xFFFFF8EA),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Arabica',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Color(0xFF734F35))),
              Text(
                'Hi, Desooky ',
                style: TextStyle(
                    color: Color(0xFF734F35),
                    fontSize: 10),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Image.asset('asset/images/des.jpg' ,),
              onPressed: () {Navigator.pushNamed(context, '/Pro');},
            ),
          ],

        ),
        body: SingleChildScrollView(

          child: Column(
            children: [
              SizedBox(height: 20.0,),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder :(context,index) => DonutsList(),
                  separatorBuilder: (context,index)=>SizedBox(height: 20.0,)
                  , itemCount:15),
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
Widget DonutsList()=> Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFF734F35),
              ),
              borderRadius: BorderRadius.all(Radius.circular(0.0))
          ),
          width: 200,
          height: 200,
          child: Image.asset('asset/images/des.jpg')
      ),
    ),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Yummy Donuts',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16.0,color: Color(0xFF734F35)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Hello Desoky what are you doing now asadsadsda sdada sdassdsad ad',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              FloatingActionButton.small(
                child:
                Icon(Icons.add,color: Colors.black),
                elevation: 0.0,
                backgroundColor:Color(0xFF734F35) ,
                onPressed: (){},
              ),
            ],
          ),
        ],
      ),
    ),
  ],
);