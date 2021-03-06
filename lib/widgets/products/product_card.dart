import 'package:flutter/material.dart';

import './price_tag.dart';
import '../ui_elements/title_default.dart';
import '../products/address_tag.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  Widget _buildTitlePriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TitleDefault(product['title']),
        SizedBox(
          width: 8.0,
        ),
        PriceTag(product['price'].toString())
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.info),
            color: Theme.of(context).accentColor,
            iconSize: 35.0,
            onPressed: () => Navigator.pushNamed<bool>(
                context, '/product/' + productIndex.toString())),
        IconButton(
          color: Colors.red,
          icon: Icon(Icons.favorite_border),
          iconSize: 35.0,
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product['image']),
          Container(
              padding: EdgeInsets.only(top: 10.0),
              child: _buildTitlePriceRow()),
          AddressTag('MG Road, Bangalore'),
          _buildActionButtons(context)
        ],
      ),
    );
  }
}
