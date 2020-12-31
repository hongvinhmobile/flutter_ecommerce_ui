import 'package:flutter/material.dart';

import '../home/widgets/build_product_card.dart';

class SavePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: .0,
        centerTitle: true,
        title: Text(
          'Saved',
          style: TextStyle(
            fontSize: _size.width / 21.5,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return BuildProductCard();
          },
        ),
      ),
    );
  }
}
