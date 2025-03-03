import 'package:bunny_ngim_app/model/response/cart_model.dart';
import 'package:bunny_ngim_app/view/base/show_custom_snackbar_widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:bunny_ngim_app/model/response/product_model.dart';
import 'dart:convert';

class CartController extends GetxController implements GetxService {
  List<CartItem> cartItems = [];
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadCart();
  }

  void addToCart(Product product, {int qty = 1}) {
    int index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      cartItems[index].quantity += qty;
      showCustomSnackBar('already_added'.tr, Get.context!, isError: false);
    } else {
      cartItems.add(CartItem(product: product, quantity: qty));
      showCustomSnackBar(
        'add_to_cart_successfully'.tr,
        Get.context!,
        isError: false,
      );
    }
    saveCart();
    update();
  }

  void removeFromCart(Product product) {
    cartItems.removeWhere((item) => item.product.id == product.id);
    saveCart();
    update();
  }

  double calculateItemTotal(CartItem item) {
    double price = double.tryParse(item.product.dfpricing ?? "0") ?? 0;
    return price * item.quantity;
  }

  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + calculateItemTotal(item));
  }

  void saveCart() {
    List<String> cartJsonList =
        cartItems.map((item) => jsonEncode(item.toJson())).toList();
    box.write('cart_items', cartJsonList);
  }

  void loadCart() {
    List<dynamic>? storedCart = box.read('cart_items');
    if (storedCart != null) {
      cartItems =
          List<String>.from(storedCart)
              .map((jsonStr) => CartItem.fromJson(jsonDecode(jsonStr)))
              .toList()
              .reversed
              .toList();
    }
    update();
  }

  void updateQty(Product product, bool increase) {
    int index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      if (increase) {
        cartItems[index].quantity++;
      } else {
        if (cartItems[index].quantity > 1) {
          cartItems[index].quantity--;
        } else {
          cartItems.removeAt(index);
        }
      }
      saveCart();
      update();
    }
  }
}
