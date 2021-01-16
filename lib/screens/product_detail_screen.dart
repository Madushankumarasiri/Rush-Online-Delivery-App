import 'package:flutter/material.dart';
import '../constants.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget{
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
   
   final productId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),

      body:SingleChildScrollView(
        child:Column(
          children: [
             Container(
              color: kPrimaryColor,
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),

             SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(loadedProduct.title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24),
            ),
              Text(
              '\$${loadedProduct.price}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            ],
             ),
             SizedBox(height:10),
                  Text(
                    loadedProduct.description,
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kPrimaryColor),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text("Add to cart",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ), ),
                SizedBox(width: 10),
                IconButton(icon: FaIcon(FontAwesomeIcons.shoppingCart), onPressed: (){},
              color: Colors.black,) 
               ],
            ),
              ),
          ],
          ),
      ),
    );
  }


}