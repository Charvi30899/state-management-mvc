import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management_app/controllers/cart_controller.dart';
import 'package:state_management_app/controllers/shopping_controller.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({ Key? key }) : super(key: key);

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.grey.shade100,
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${controller.products[index].productName}",
                                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                  Text("${controller.products[index].description}",
                                  style: TextStyle(fontWeight: FontWeight.normal),)
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("\$${controller.products[index].price}",
                                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                  RaisedButton(onPressed: (){
                                    cartController.addToCart(controller.products[index]);
                                  },
                                  child: Text('Add to cart'),
                                  color: Colors.blue,
                                  textColor: Colors.white,)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
                }
              )),
              GetX<CartController>(
                builder: (controller) {
                  return Text('Total amount: \$${controller.totalPrice}',
                  style: TextStyle(fontSize: 20,color: Colors.white),);
                }
              ),
              SizedBox(height: 100,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
      backgroundColor: Colors.amber,
      icon: Icon(Icons.add_shopping_cart_outlined,
      color: Colors.black,),
      label: GetX<CartController>(
        builder: (controller) {
          return Text(controller.count.toString(),
          style: TextStyle(color: Colors.black,fontSize: 20),);
        }
      )),
    );
  }
}