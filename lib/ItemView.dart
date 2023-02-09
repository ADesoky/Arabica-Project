import 'package:arabicaa/medels/product_model.dart';
import 'package:flutter/material.dart';
import 'package:counter_button/counter_button.dart';
class ItemView extends StatefulWidget {
   ItemView({Key? key, required this.productsData}) : super(key: key);
  ProductsData productsData;

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  int counter =0;
  void IncrementCount(){
    setState(() {
      counter++;
    });
  }
  void DecrementCount(){
    setState(() {
      counter--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFFFF8EA),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFFFFF8EA),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Center(
                child: Image.network(widget.productsData.coffeeshopItemImages![0].coffeeshopItemImage! ,),
              ),
             SizedBox(height: 23,),
              SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(widget.productsData.itemName!,
                      style:
                      TextStyle(fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF734F35)),),
                    Container(

                      width: 300.0,
                        height: 86,
                       child: Text(widget.productsData.itemDesc!,
                           style:
                           TextStyle(fontSize: 15.0,
                               color: Color(0xFF734F35)),),
                    ),

                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    child: Icon(Icons.remove,color: Colors.black,),
                    backgroundColor:Color(0xFFFFF8EA) ,
                    elevation: 0.0,
                    onPressed: DecrementCount,
                  ),
                  Text("$counter"),
                  FloatingActionButton(
                    child:
                    Icon(Icons.add,color: Colors.black),
                    elevation: 0.0,
                    backgroundColor:Color(0xFFFFF8EA) ,
                    onPressed: IncrementCount,
                  ),

                ],
              ),
              Container(
                width: double.infinity,
                height: 60.0,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF734F35)),
                    onPressed: () {
                      // Navigator.pushNamed(context, 'cart');
                    },
                    child: const Text('Add To Cart',style: TextStyle(color: Colors.white),)),
              ),
            ],
          ),
        ),

      ),



    );
  }
}
