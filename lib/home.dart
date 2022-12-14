import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shopping/cartmodel.dart';

class HomePage extends StatelessWidget {
  List<Product> _products = [
    Product(
        id: 1,
        title: "Coxinha",
        price: 20.0,
        imgUrl: "https://cdn.discordapp.com/attachments/1038488267886186538/1052389444549877781/download_6.jpg",
        qty: 1),
    Product(
        id: 2,
        title: "Empada",
        price: 40.0,
        imgUrl: "https://cdn.discordapp.com/attachments/1038488267886186538/1052389728206458970/download_7.jpg",
        qty: 1),
    Product(
        id: 3,
        title: "Refrigerante",
        price: 20.0,
        imgUrl: "https://cdn.discordapp.com/attachments/1038488267886186538/1052389869512572958/123843.jpg",
        qty: 1),
    Product(
        id: 4,
        title: "Suco",
        price: 40.0,
        imgUrl: "https://cdn.discordapp.com/attachments/1038488267886186538/1052390002685915176/download_8.jpg",
        qty: 1),
    Product(
        id: 5,
        title: "Bala",
        price: 25.0,
        imgUrl: "https://cdn.discordapp.com/attachments/1038488267886186538/1052390147334864906/7078-3.jpg",
        qty: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Inicio | Cantina do Bentão"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          )
        ],
      ),
      body:
      GridView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: _products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8, childAspectRatio: 0.8),
        itemBuilder: (context, index){
          return ScopedModelDescendant<CartModel>(
              builder: (context, child, model) {
            return Card( child: Column( children: <Widget>[
              Image.network(_products[index].imgUrl, height: 120, width: 120,),
              Text(_products[index].title, style: TextStyle(fontWeight: FontWeight.bold),),
              Text("\$"+_products[index].price.toString()),
              OutlineButton(
                    child: Text("Add"),
                    onPressed: () => model.addProduct(_products[index]))
            ])); 
          });
        },
      ),

      // ListView.builder(
      //   itemExtent: 80,
      //   itemCount: _products.length,
      //   itemBuilder: (context, index) {
      //     return ScopedModelDescendant<CartModel>(
      //         builder: (context, child, model) {
      //       return ListTile(
      //           leading: Image.network(_products[index].imgUrl),
      //           title: Text(_products[index].title),
      //           subtitle: Text("\$"+_products[index].price.toString()),
      //           trailing: OutlineButton(
      //               child: Text("Add"),
      //               onPressed: () => model.addProduct(_products[index])));
      //     });
      //   },
      // ),

    );
  }
}
