import 'package:fakestore_api_shop/src/components/product_card.dart';
import 'package:fakestore_api_shop/src/config/ktext.dart';
import 'package:fakestore_api_shop/src/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  List categoryList = [
    "All",
    "Best Selling",
    "Jackets",
    "Shirts",
    "Pants",
    "Bags"
  ];
  List imageList = [
    "Black Pant",
    "Black T-Shirt",
    "Warm Jacket",
    "Ladies Bag",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding:
              EdgeInsets.only(top: size.height * 0.03, left: size.width * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: size.width * 0.06),
                child: Container(
                  width: size.width * 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Find your product',
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 30,
                        )),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: size.height * 0.02, right: size.width * 0.06),
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/cover.jpg',
                    width: size.width / 1.1,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < categoryList.length; i++)
                      Container(
                        margin: EdgeInsets.all(8),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                        decoration: BoxDecoration(
                            color: categoryList[i] == 'All'
                                ? Colors.black
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: KText(
                          text: categoryList[i],
                          color: categoryList[i] == 'All'
                              ? scaffoldBAckgroundColor
                              : Colors.grey[500],
                        )),
                      ),
                  ],
                ),
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: imageList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (size.width - 30 - 15) / (2 * 290)),
                itemBuilder: (context, index) {
                  if (index % 2 == 0) {
                    return ProductCard(img: imageList[index]);
                  }

                  return OverflowBox(
                    maxHeight: 290 + 70,
                    child: Container(
                      child: ProductCard(img: imageList[index]),
                    ),
                  );
                },
              )
            ],
          ),
        )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: scaffoldBAckgroundColor,
        iconSize: 30,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[200],
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart_fill),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: ''),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor('#FF6162'),
        child: Icon(Icons.camera),
        onPressed: (){

      },
      
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
          );
  }
}
