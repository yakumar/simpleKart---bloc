import 'package:flutter/material.dart';
import '../models/Product_Model.dart';
import '../bloc/bloc.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  final productLists = Provider.of<ProductList>(context);

    // TODO: implement build
    return StreamBuilder<ProductList>(
        initialData: newBloc.sampleList,
        stream: newBloc.allStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ProductList productLists = snapshot.data;
            return Scaffold(
              body: SafeArea(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      CartyCustomAppBar(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      CartyProductList(productLists.productList),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      TotalCart(productLists.productList),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container(
              child: Text('No Data'),
            );
          }
        });
  }
}

class TotalCart extends StatelessWidget {
  final List<Product> productlists;
  TotalCart(this.productlists);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Total',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
          ),
          Text('\$${_returnTotal(productlists).round()}',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w600),
                        ),
        ],
      ),
    );
  }
  double _returnTotal(List<Product> productLists){
    double total = 0;
    productLists.forEach((product){
      total = total + product.quantity * product.price;

    
      

    });
    return total;

  }
}

class CartyProductList extends StatelessWidget {
  final List<Product> productlists;
  CartyProductList(this.productlists);

  @override
  Widget build(BuildContext context) {
    print('Product length: ${productlists.length}');

    // TODO: implement build
    return ListView.builder(
        shrinkWrap: true,
        itemCount: productlists.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Image.network(
                        productlists[index].imgUrl,
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                    ),
                    Text(
                      productlists[index].name,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Text(
                  '\$${productlists[index].price}',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
                Text(
                  productlists[index].quantity.toString(),
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          );
        });
  }
}

class CartyCustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[cartWidget(context)],
      ),
    );
  }

  GestureDetector cartWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.16,
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          Icons.backspace,
          size: 30.0,
          color: Colors.yellow[600],
        ),
      ),
    );
  }
}
