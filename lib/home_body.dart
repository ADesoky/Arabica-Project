import 'package:arabicaa/config.dart';
import 'package:arabicaa/medels/categories_model.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'HotCoffee.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  keyboardType: TextInputType.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefix: Icon(Icons.search),
                      label: Text(' Search'),
                      labelStyle: TextStyle(color: Color(0xFFA88164))),
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Category',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFF734F35)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Row(
                  //   children: [
                  //     Container(
                  //       width: 68,
                  //       height: 68,
                  //       decoration: BoxDecoration(
                  //           border: Border.all(
                  //             color: Color(0xFFA88164),
                  //           ),
                  //           borderRadius:
                  //           BorderRadius.all(Radius.circular(15.0))),
                  //       child: IconButton(
                  //         icon: Image.asset('asset/images/Hot Coffee.png'),
                  //         onPressed: () {
                  //           Navigator.pushNamed(context, 'hot');
                  //         },
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 24.0,
                  //     ),
                  //     Container(
                  //       width: 68,
                  //       height: 68,
                  //       decoration: BoxDecoration(
                  //           border: Border.all(
                  //             color: Color(0xFFA88164),
                  //           ),
                  //           borderRadius:
                  //           BorderRadius.all(Radius.circular(15.0))),
                  //       child: IconButton(
                  //         icon: Image.asset('asset/images/Vector.png'),
                  //         onPressed: () {
                  //           Navigator.pushNamed(context, 'ice');
                  //         },
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 24.0,
                  //     ),
                  //     Container(
                  //       width: 68,
                  //       height: 68,
                  //       decoration: BoxDecoration(
                  //           border: Border.all(
                  //             color: Color(0xFFA88164),
                  //           ),
                  //           borderRadius:
                  //           BorderRadius.all(Radius.circular(15.0))),
                  //       child: IconButton(
                  //         icon: Image.asset('asset/images/Donuts.png'),
                  //         onPressed: () {
                  //           Navigator.pushNamed(context, 'don');
                  //         },
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 24.0,
                  //     ),
                  //     Container(
                  //       width: 68,
                  //       height: 68,
                  //       decoration: BoxDecoration(
                  //           border: Border.all(
                  //             color: Color(0xFFA88164),
                  //           ),
                  //           borderRadius:
                  //           BorderRadius.all(Radius.circular(15.0))),
                  //       child: IconButton(
                  //         icon: Image.asset('asset/images/Layer 2.png'),
                  //         onPressed: () {},
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 24.0,
                  //     ),
                  //   ],
                  // ),
                  Container(
                    height: 68,
                    child:

                        isLoaded?

                    ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 20.0,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CategoryList(categoriesModel!.categoryData![index]),
                      itemCount: categoriesModel!.categoryData!.length,
                    )  : Center(child: CircularProgressIndicator(),),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Offers',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF734F35)),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 200.0,
                    child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 20.0,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => OfferList(),
                      itemCount: 10,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Trends Now',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF734F35)),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 200.0,
                    child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 20,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => TrendList(),
                      itemCount: 10,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Item List',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF734F35)),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => ItemsList(),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20.0,
                      ),
                      itemCount: 15),
                ],
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget OfferList() => Container(
    //width: 250.0,
    height: 200.0,
    child: Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF734F35),
                ),
                borderRadius: BorderRadius.all(Radius.circular(0.0))),
            width: 200,
            height: 200,
            child: Image.asset('asset/images/des.jpg')),
         Positioned(
          left: 10,
          child: BlurryContainer(
            blur: 2,
            width: 250,
            height: 50,
            elevation: 0,
            color: Colors.transparent,
            padding: EdgeInsets.all(8),
            child: Text(
              'Ahmed Desoky ',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                // fontSize: 10.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          right: 5,
          bottom: 5,
          child: FloatingActionButton.small(
            child: Icon(Icons.add, color: Colors.black),
            elevation: 0.0,
            backgroundColor: Color(0xFF734F35),
            onPressed: () {
              //Navigator.pushNamed(context, 'cart');
            },
          ),
        ),
      ],
    ),
  );

  Widget TrendList() => Container(
    //width: 250.0,
    height: 200.0,
    child: Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF734F35),
                ),
                borderRadius: BorderRadius.all(Radius.circular(0.0))),
            width: 200,
            height: 200,
            child: Image.asset('asset/images/des.jpg')),
        const Positioned(
          left: 10,
          child: BlurryContainer(
            blur: 1,
            width: 250,
            height: 50,
            elevation: 0,
            color: Colors.transparent,
            padding: EdgeInsets.all(8),
            child: Text(
              'Ahmed Desoky ',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                // fontSize: 10.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          right: 5,
          bottom: 5,
          child: FloatingActionButton.small(
            child: Icon(Icons.add, color: Colors.black),
            elevation: 0.0,
            backgroundColor: Color(0xFF734F35),
            onPressed: () {},
          ),
        ),
      ],
    ),
  );

  Widget CategoryList(CategoryData categoryData) => Container(
    width: 68,
    height: 68,
    decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFA88164),
        ),
        borderRadius:
        BorderRadius.all(Radius.circular(15.0))),
    child: IconButton(
      icon: Image.network(categoryData.coffeeshopItemCategoryImg!),
      onPressed: () {
     //   Navigator.pushNamed(context, '/don');
        Navigator.push(context,MaterialPageRoute(builder: (context)=>Products(categoryData: categoryData,)));
      },
    ),
  );
  Widget ItemsList() => Row(
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
                borderRadius: BorderRadius.all(Radius.circular(0.0))),
            width: 170,
            height: 170,
            child: Image.asset('asset/images/des.jpg')),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Espresso Coffee',
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
                const Expanded(
                  child: Text(
                    'Hello Desoky what are you doing now asadsadsda sdada sdassdsad ad',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                FloatingActionButton.small(
                  child: Icon(Icons.add, color: Colors.black),
                  elevation: 0.0,
                  backgroundColor: Color(0xFF734F35),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
  @override
  void initState() {
    // TODO: implement initState
    getCategories();
    super.initState();
  }

  bool isLoaded = false;
  Categories? categoriesModel;
  Future getCategories() async{
    var response = await Dio().get('${APIConfig.BASE_URL}loadCategories.php');
    categoriesModel = Categories.fromJson(response.data);
    if(categoriesModel!.categoryData!.isNotEmpty){
      print(categoriesModel!.categoryData![0].coffeeshopItemCategoryName);
      setState(() {
        isLoaded = true;
      });
    }

  }

}
