import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CartService {
  static const String _keyCart = 'cart';

  Future<void> addToCart(int productId) async {
    final prefs = await SharedPreferences.getInstance();
    List<int> cart = await getCartItems();

    if (!cart.contains(productId)) {
      cart.add(productId);
      await prefs.setString(_keyCart, json.encode(cart));
    }
  }

  Future<void> removeFromCart(int productId) async {
    final prefs = await SharedPreferences.getInstance();
    List<int> cart = await getCartItems();

    cart.remove(productId);
    await prefs.setString(_keyCart, json.encode(cart));
  }

  Future<List<int>> getCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final String? cartString = prefs.getString(_keyCart);

    if (cartString == null) {
      return [];
    }

    final List<dynamic> cartList = json.decode(cartString);
    return cartList.map((item) => item as int).toList();
  }

  Future<bool> isInCart(int productId) async {
    List<int> cart = await getCartItems();
    return cart.contains(productId);
  }
}
