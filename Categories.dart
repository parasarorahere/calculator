import 'package:flutter/material.dart';
import '../pages/productList.dart';
import 'package:path/path.dart';

class Categories extends StatelessWidget {
  Widget _buildSingleCategory(imageName, caption,BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
           Navigator.of(context)
              .push(MaterialPageRoute(builder: (context)=>
             productList(),
          ));
        },
        child: Container(
            width: 100,
            child: ListTile(
              title: Image.network(imageName),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  caption,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
              ),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _buildSingleCategory("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnSINW9OOWkS5TrB6Lrsk1D0Aiuacvn0CEv8zztR6KDEu_4nlLyw", 'Coat',context),
          _buildSingleCategory("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnSINW9OOWkS5TrB6Lrsk1D0Aiuacvn0CEv8zztR6KDEu_4nlLyw", 'Jeans',context),
          _buildSingleCategory("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnSINW9OOWkS5TrB6Lrsk1D0Aiuacvn0CEv8zztR6KDEu_4nlLyw", 'TShirt',context),
          _buildSingleCategory("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnSINW9OOWkS5TrB6Lrsk1D0Aiuacvn0CEv8zztR6KDEu_4nlLyw", 'Tie',context),
          _buildSingleCategory("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnSINW9OOWkS5TrB6Lrsk1D0Aiuacvn0CEv8zztR6KDEu_4nlLyw", 'Hat',context),
  //        _buildSingleCategory('assets/images/jeans.png', 'Trouser')
        ],
      ),
    );
  }
}