import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geojit_test_app/controller/product_controller.dart';
import 'package:geojit_test_app/controller/cartController.dart';
import 'package:geojit_test_app/model/all_data.dart';
import 'package:geojit_test_app/view/cart_page.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AllDataController allDataController = Get.put(AllDataController());
  final CartController cartController = Get.put(CartController());
  List<AllData> listedItemList = [];

  getList() async {
    allDataController.fetchAllData().then((value) {
      setState(() {
        listedItemList.addAll(value);
      });
    });
    print(listedItemList.length);
  }

  @override
  Widget build(BuildContext context) {
    getList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 50,
        flexibleSpace: Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Row(
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => CartProducts()),
                      );
                    },
                      child: Stack(
                        children: [

                          Icon(
                    Icons.shopping_cart,
                    size: 30,
                  ),
                          Positioned(right:5,child: Text(cartController.cartItems.length.toString(),style: TextStyle(fontSize: 15,color: Colors.white),))
                        ],
                      )),
                  SizedBox(width: 20,)
                ],
              )
            ],
          ),
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 150,
                child: ListView.builder(
                    itemCount: listedItemList.length,
                    itemBuilder: (BuildContext ctx, index) {
                      String image_url =
                      listedItemList[index].products[index].thumbnail.toString();
                      return GestureDetector(
                          child: ListTile(
                            leading: Image.network(image_url),
                            subtitle: Text("Rs."+
                                listedItemList[index].products[index].price.toString()),
                            title: Text(
                                listedItemList[index].products[index].title),
                            trailing: GestureDetector(
                                onTap: () {
                                  cartController.addToCart(listedItemList[index],index);
                                },
                                child: Icon(Icons.add_circle)),
                          ));
                    })),
          ],
        ),
      ),
    );
  }
}
