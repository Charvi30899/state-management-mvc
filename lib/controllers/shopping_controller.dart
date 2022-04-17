import 'package:get/get.dart';
import 'package:state_management_app/models/product.dart';

class ShoppingController extends GetxController{
  RxList<Product> products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async{
    await Future.delayed(Duration(seconds: 1));

    var producrResult = [
      Product(
        id: 1,
        productName: "Apple",
        productImage: "abc",
        description: "Apple is good for health",
        price: 20.0
      ),
        Product(
        id: 1,
        productName: "Orange",
        productImage: "def",
        description: "Orange is good for health",
        price: 21.0
      ),
        Product(
        id: 1,
        productName: "Banana",
        productImage: "ghi",
        description: "Banana is good for health",
        price: 23.0
      )
    ];
    products.value = producrResult;
  }

}