import 'package:flutter/material.dart';

class ShopCart extends StatefulWidget {
  const ShopCart({Key? key}) : super(key: key);

  @override
  State<ShopCart> createState() => _ShopCartState();
}

class _ShopCartState extends State<ShopCart> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(
        children: [
          SizedBox(height: 20.0,),
          Image.asset('asset/images/cart.png'),
          ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder :(context,index) => ItemsList(),
              separatorBuilder: (context,index)=>SizedBox(height: 20.0,)
              , itemCount:2),
          SizedBox(height: 20.0,),
          Container(
            width: double.infinity,
            height: 60.0,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00A006)),
                onPressed: () {
                   Navigator.pushNamed(context, '/Pay');
                },
                child: const Text('Payment',style: TextStyle(color: Colors.white),)
            ),
          ),
        ],


      ),
    );
  }
}
Widget ItemsList()=> Row(
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
            'Espresso Coffee',
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