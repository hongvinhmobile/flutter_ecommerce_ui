import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class VouchersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VouchersPageState();
}

class _VouchersPageState extends State<VouchersPage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: .0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Feather.arrow_left,
            size: _size.width / 15.0,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Vouchers',
          style: TextStyle(
            fontSize: _size.width / 21.5,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => null,
            icon: Icon(
              Feather.plus_square,
              size: _size.width / 15.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
