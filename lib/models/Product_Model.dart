import 'package:flutter/material.dart';

class Product {
  int id;
  String name;
  String imgUrl;
  double price;
  int quantity;

  Product(
      {@required this.id,
      @required this.name,
      @required this.imgUrl,
      @required this.price,
      this.quantity = 0});

void incrementQuantity(){
  this.quantity = this.quantity + 1;
}
void decrementQuantity(){
  this.quantity = this.quantity - 1;
}
}
class ProductList {
  int count;
  // set count(givenC) => count + givenC; 
  List<Product> productList;

  ProductList({@required this.productList, this.count = 0});
}



var sampleProductList = ProductList(productList:[
  Product(
    id: 1,
    price: 20,
      name: "Bajjis",
      imgUrl:
          'https://i.pinimg.com/originals/24/fe/a7/24fea75ea368b364bbd54099002e03bd.jpg'
          ),

  Product(
    id: 2,
    price: 35,
      name: "Badam Kheer",
      imgUrl:
          'http://www.maatamanti.com/wp-content/uploads/2017/09/Sabudana-Kheer3.jpg'
    

  ),
      

]);
