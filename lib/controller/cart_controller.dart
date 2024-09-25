import 'package:get/get.dart';
import 'package:mainproject/model/shop_items.dart';

class CartController extends GetxController {
  var cartItems = <ShopItem, int>{}.obs;
  double get totalPrice => cartItems.entries
      .fold(0, (sum, entry) => sum + (entry.key.price * entry.value));

  void addToCart(ShopItem item) {
    if (cartItems.containsKey(item)) {
      cartItems[item] = cartItems[item]! + 1;
    } else {
      cartItems[item] = 1;
    }
  }

  void removeFromCart(ShopItem item) {
    if (cartItems.containsKey(item)) {
      if (cartItems[item]! > 1) {
        cartItems[item] = cartItems[item]! - 1;
      } else {
        cartItems.remove(item);
      }
    }
  }
}
