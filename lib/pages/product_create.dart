import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);
  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue = "";
  String _descriptionValue = "";
  double _priceValue;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Title'),
      onSaved: (String value) {
        setState(() {
          _titleValue = value;
          print('Title saved');
        });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Description'),
        maxLines: 5,
        onSaved: (String value) {
          setState(() {
            _descriptionValue = value;
            print('Title saved');
          });
        });
  }

  Widget _buildPriceTextField() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Price'),
        keyboardType: TextInputType.number,
        onSaved: (String value) {
          setState(() {
            _priceValue = double.parse(value);
            print('Title saved');
          });
        });
  }

  void _submitForm() {
    _formKey.currentState.save();
    final Map<String, dynamic> product = {
      'title': _titleValue,
      'description': _descriptionValue,
      'price': _priceValue,
      'image': 'assets/food.jpg'
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return Container(
      width: targetWidth,
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
          children: <Widget>[
            _buildTitleTextField(),
            _buildDescriptionTextField(),
            _buildPriceTextField(),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              textColor: Colors.white,
              child: Text('Save'),
              onPressed:
                  _submitForm, // not calling the function, just referencing
            )
          ],
        ),
      ),
    );
  }
}
