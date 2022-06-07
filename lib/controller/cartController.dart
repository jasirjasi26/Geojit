
import 'package:geojit_test_app/model/all_data.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CartController extends GetxController{

  var guestcounts = 0.obs;
  var cartItems = <AllData>[].obs;
  int get count => cartItems.length;

  addToCart(AllData product, int index){
    cartItems.add(product);
  }

}