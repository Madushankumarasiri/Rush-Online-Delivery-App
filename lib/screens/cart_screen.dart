import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:rush_delivery/screens/successful_page.dart';

import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';
import '../providers/orders.dart';
import '../constants.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            shadowColor: kPrimaryColor.withOpacity(.60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            elevation: 2,
            margin: EdgeInsets.all(15),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: kPrimaryColor, width: 8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20, color: kPrimaryColor),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color:
                            Theme.of(context).primaryTextTheme.headline6.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  OrderButton(cart: cart)
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartItem(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;
  _openPopup(context) {
    String address = '';
    String payment = '';

    Alert(
        context: context,
        title: "Add your details",
        content: Column(
          children: <Widget>[
            TextField(
              onChanged: (val) {
                setState(() => address = val);
              },
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: 'Address',
              ),
            ),
            TextField(
              obscureText: true,
              onChanged: (val) {
                setState(() => payment = val);
              },
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Payment',
                // controller: PaymentController,
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            child: Text('Confirm Order'),
            onPressed: (widget.cart.totalAmount <= 0 || _isLoading)
                ? null
                : () async {
                    setState(() {
                      _isLoading = true;
                    });
                    Navigator.pop(context);
                   
                    await Provider.of<Orders>(context, listen: false).addOrder(
                        widget.cart.items.values.toList(),
                        widget.cart.totalAmount,
                        address,
                        payment);
                    setState(() {
                      _isLoading = false;
                    });
                    Navigator.of(context)
                  .pushReplacementNamed(Successfullpage.routeName);
                    widget.cart.clear();
                  },
          )
        ]).show();
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        child: Text('Checkout'),
        onPressed: () {
          _openPopup(context);
        });
  }
}
