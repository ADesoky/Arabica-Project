import 'package:arabicaa/ItemView.dart';
import 'package:arabicaa/config.dart';
import 'package:arabicaa/medels/categories_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'medels/product_model.dart';

class Products extends StatefulWidget {
   Products({Key? key,required this.categoryData}) : super(key: key);
  CategoryData categoryData;
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8EA),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xFFFFF8EA),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Arabica',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Color(0xFF734F35))),
            Text(
              'This is ${widget.categoryData.coffeeshopItemCategoryName}',
              style: TextStyle(
                  color: Color(0xFF734F35),
                  fontSize: 10),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Image.network(globalUserModel!.userData!.userImage!),
            onPressed: () {
              Navigator.pushNamed(context, '/Pro');
            },
          ),
        ],

      ),
      body:
      isLoaded? ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => HotList(productsModel!.productsData![index]),
          separatorBuilder: (context, index) => SizedBox(height: 20.0,)
          ,
          itemCount: productsModel!.productsData!.length) : Center(child: CircularProgressIndicator(),),

    );
  }

  @override
  void initState() {
    // TODO: implement initState
    getProductByCategory();
    super.initState();
  }

  bool isLoaded = false;
  ProductsModel? productsModel;

  Future getProductByCategory() async {
    var response = await Dio().get(
        '${APIConfig.BASE_URL}getProductByCategory.php', queryParameters: {
      'coffeeshop_item_category_id': widget.categoryData
          .coffeeshopItemCategoryId,
    });
    productsModel = ProductsModel.fromJson(response.data);
    if (productsModel!.productsData!.isNotEmpty) {
      print(productsModel!.productsData![0].coffeeshopItemCategoryName);
      setState(() {
        isLoaded = true;
      });
    }
  }


  Widget HotList(ProductsData productsData) =>
      Row(
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
                child: Image.network(productsData.coffeeshopItemImages![0].coffeeshopItemImage!)
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  productsData.itemName!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Color(0xFF734F35)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                     Expanded(
                      child: Text(
                        productsData.itemDesc!,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    FloatingActionButton.small(
                      child:
                      Icon(Icons.add, color: Colors.black),
                      elevation: 0.0,
                      backgroundColor: Color(0xFF734F35),
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>ItemView( productsData: productsData,)));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
}