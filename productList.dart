import 'package:flutter/material.dart';
import '../widgets/Cart.dart';
class productList extends StatelessWidget {
  @override
  final String appbarkey;
  productList({Key key, this.appbarkey}) : super(key: key);

  Widget _funReturnAppbar( context)
  {
    return AppBar(
      backgroundColor: Colors.teal,
      title: Text(appbarkey),
      actions: <Widget>[

        IconButton(
          onPressed: () {
            print("Cart Call");
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
          },
          icon: Icon(Icons.add_shopping_cart, color: Colors.white),
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
       appBar: _funReturnAppbar(context),
    );
  }
}
