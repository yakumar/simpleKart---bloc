import '../models/Product_Model.dart';
import 'dart:async';


class NewBloc implements DisposeBloc {

    ProductList sampleList = sampleProductList;

    int counter = 0;

  final counterController = StreamController<int>.broadcast();
  get counterSink => counterController.sink;

  get counterStream => counterController.stream;


final streamController = StreamController<ProductList>.broadcast();

  get streamSink => streamController.sink;

  get allStream => streamController.stream;

  void addProduct(Product item) {
//           _sampleList.productList.add(item);

    sampleList.productList.forEach((product) {
      if (product.id == item.id) {
        product.incrementQuantity();
        

        
      }
    });
    //sampleList.count++;
    counter++;
    counterSink.add(counter);


    streamSink.add(sampleList);
    

  }
  



  NewBloc();

  @override
  dispose() {
    streamController.close();
    counterController.close();
  }

  
  
}

abstract class DisposeBloc {
  void dispose();
  

}

final newBloc = NewBloc();