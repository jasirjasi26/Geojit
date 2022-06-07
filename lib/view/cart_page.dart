import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geojit_test_app/controller/product_controller.dart';
import 'package:geojit_test_app/controller/cartController.dart';
import 'package:geojit_test_app/model/all_data.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class CartProducts extends StatefulWidget {
  @override
  State<CartProducts> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CartProducts> {
  final CartController cartController = Get.put(CartController());



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height-100,
                child: ListView.builder(
                    itemCount: cartController.cartItems.length,
                    itemBuilder: (BuildContext ctx, index) {
                      String image_url =
                      cartController.cartItems[index].products[index].thumbnail.toString();
                      return GestureDetector(
                          child: ListTile(
                            subtitle: Text("Rs."+
                                cartController.cartItems[index].products[index].price.toString()),
                            leading: Image.network(image_url),

                            title:Text(cartController.cartItems[index].products[index].title) ,
                          )
                      );
                    })),

          ],
        ),
      ),
    );
  }
}
