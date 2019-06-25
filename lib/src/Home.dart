import 'package:flutter/material.dart';
import '../models/Product_Model.dart';
import '../bloc/bloc.dart';


class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  //  final productLists = Provider.of<ProductList>(context);

  


    // Consumer<ProductList>(
    //   builder: (BuildContext context, productLists, _) {
        
    //     return 
    
    // TODO: implement build
    return Scaffold(
          body: SafeArea(
            child: Container(
              child: Column(
                children: <Widget>[
                  CustomAppBar(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  ProductListy(),
                ],
              ),
            ),
          ),
        );
      
  }
}

class ProductListy extends StatelessWidget {

 

  @override
  Widget build(BuildContext context) {
    
    
    // TODO: implement build
    return StreamBuilder<ProductList>(
      initialData: newBloc.sampleList,

      stream: newBloc.allStream,
      builder: (context, snapshot) {
        if (snapshot.hasData){
          ProductList productLists = snapshot.data;

          return ListView.builder(
            shrinkWrap: true,
            itemCount: productLists.productList.length,
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
                            productLists.productList[index].imgUrl,
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                        ),
                        Text(
                          productLists.productList[index].name,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Text(
                      '\$${productLists.productList[index].price}',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                     Text('\$${productLists.productList[index].quantity}',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
                    GestureDetector(
                      child: Icon(Icons.person_add),
                      onTap: () {
                        _addProduct(productLists.productList[index]);

                        print('bajji tappd');
                      },
                    )
                  ],
                ),
              );
            },
            );

        }else {
          return Container(child: Text('No Data'),);
        }
        
      }
    );
  }

  _addProduct(Product producty) {
    
    
    newBloc.addProduct(producty);

    
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // final leng1 = Provider.of<ProductList>(context).count;
     // int leng = productLists.count;
    // TODO: implement build
    return StreamBuilder<int>(
      initialData: newBloc.counter,
      stream: newBloc.counterStream,
      builder: (context, snapshot) {
       
        if(snapshot.hasData){
          return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.notifications_active,
                size: 30.0,
              ),
              cartWidget(context, snapshot.data)
            ],
          ),
        );

        }else {
          return Container(child: Text('No COunter Data'),);
        }
        
      }
    );
    
    }
   
    }

  GestureDetector cartWidget(BuildContext context, int leng) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/cart');
      },
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.16,
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
          color: Colors.yellow[600],
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          '${leng}',
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
        ),
      ),
    );
  
}
