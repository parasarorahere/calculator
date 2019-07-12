import 'package:flutter/material.dart';
import '../widgets/Cart.dart';
import '../models/fakeDataJsonStatic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class productList extends StatefulWidget {
  final String appbarkey;
  productList({Key key, this.appbarkey}) : super(key: key);

  @override
  _productListState createState() => _productListState();
}

class _productListState extends State<productList> {

  List<fakeDataJsonStatic> fakelist  =[ fakeDataJsonStatic("https://ssl-product-images.www8-hp.com/digmedialib/prodimg/lowres/c06017872.png",2300,19,"hp",01),
 fakeDataJsonStatic("https://zdnet1.cbsistatic.com/hub/i/r/2019/04/17/1f68c3a6-495e-4325-bc16-cc531812f0ec/thumbnail/770x433/84ff4194826e8303efb771cd377a854f/chuwi-herobook-header.jpg", 50000, 20, "Macbook",02),
  ];
  

  Widget _funReturnAppbar(BuildContext context)
  {
    return AppBar(
      backgroundColor: Colors.teal,
      title: Text(widget.appbarkey),
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

  String  funString (BuildContext context, int index)
  {
  return "price ${fakelist[index].productPrice}";
  }

  // function which add our data to firbase
  _addRecordInDb(BuildContext context, int index ) async {
    Map<String, Object> map = <String, Object>{
      'id': fakelist[index].id,
      'name': fakelist[index].productName,
      'price': fakelist[index].productPrice,
      'url': fakelist[index].imageUrl,
    };
    final DocumentReference documentReference =
    Firestore.instance.document("products/"+fakelist[index].id.toString() );
    documentReference.setData(map).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));
  }




  Widget _funReturnBody(context)
  {
    return ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: fakelist.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Card(
              elevation: 7,
              child: Column(
                children: <Widget>[

                  Row(
                    children: <Widget>[
                      Container(
                        width: 80,
                        height: 110,
                        child: Image.network(
                          fakelist[index].imageUrl,
                        ),
                      ),

                      Container(
                            padding: EdgeInsets.fromLTRB(17, 10, 70, 10),
                            child: Text(fakelist[index].productName,style: TextStyle(fontStyle: FontStyle.normal,fontSize: 20),),
                          ),
                      Container(
                        child: Text(funString(context ,index),style: TextStyle(  fontSize: 20)),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(child:
                      MaterialButton(
                        onPressed: ()
                        {
                        _addRecordInDb( context ,index);
                        },
                        child:  Text("add to cart",style: TextStyle( fontSize: 20)),


                      ),
                        flex: 1,

          ),
                     Expanded(child:
                      MaterialButton(
                        onPressed: ()
                        {

                        },
                        child:  Text("buy Now",style: TextStyle( fontSize: 20)),
                      ),
                       flex: 1,
                     ),
                    ],
                  )
                ],
              ),
            )
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _funReturnAppbar( context),
      body: _funReturnBody(context),
    );

  }


}
