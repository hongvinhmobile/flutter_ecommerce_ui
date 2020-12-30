import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:now/src/models/member.dart';
import 'package:now/src/pages/members/widgets/bar_chart.dart';
import 'package:now/src/pages/members/widgets/bottom_info.dart';
import 'package:now/src/widgets/voucher_card.dart';

class MembersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MembersPage();
}

class _MembersPage extends State<MembersPage> {
  List<double> files = [12.17, 24.0, 10.02, 22.21, 13.83, 14.16, 19.30];
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Feather.arrow_left,
            size: _size.width / 15.0,
            color: Colors.black,
          ),
        ),
        elevation: 2.5,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'My Store',
          style: TextStyle(
            color: Colors.black,
            fontSize: _size.width / 21.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => null,
            icon: Icon(
              Feather.sliders,
              size: _size.width / 18.0,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 2.0,
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              _buildTitle(context, 'Products'),
              SizedBox(
                height: 12.0,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 4.0),
                height: _size.width * .6,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return _buildVoucherItem(context, index);
                  },
                ),
              ),
              _buildTitle(context, 'Vouchers'),
              SizedBox(
                height: 12.0,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 4.0),
                height: _size.width * .6,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return _buildVoucherItem(context, index);
                  },
                ),
              ),
              Divider(
                height: .35,
                thickness: .35,
                indent: 24.0,
                endIndent: 24.0,
                color: Colors.grey.shade400,
              ),
              SizedBox(
                height: 20.0,
              ),
              _buildTitle(context, 'Members'),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 4.0),
                height: _size.height * .15,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: members.length,
                  itemBuilder: (context, index) {
                    return _buildCircleUser(context, members[index], index);
                  },
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Member Active Daily',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: _size.width / 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Raleway-Bold",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.0,
                ),
                height: _size.height * .5,
                child: BarChartOnline(
                  files: files,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircleUser(context, Member member, index) {
    void showInfoBottomSheet() {
      showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return BottomInfo();
        },
      );
    }

    final _size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: index == 0 ? 8.0 : 16.0),
      child: GestureDetector(
        onTap: () => showInfoBottomSheet(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: _size.width * .175,
              width: _size.width * .175,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(member.urlToImage),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(
                right: 6.0,
                bottom: 2.0,
              ),
              child: Container(
                height: 16.0,
                width: 16.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                child: Container(
                  height: 12.0,
                  width: 12.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index % 2 == 0 ? Color(0xFF00D300) : Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              member.username,
              style: TextStyle(
                fontSize: _size.width / 34.0,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVoucherItem(context, index) {
    return VoucherCard(
      index: index,
    );
  }

  Widget _buildTitle(context, title) {
    final _size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: _size.width / 22.5,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed('/${title.toString().toLowerCase()}'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'See All',
                  style: TextStyle(
                    fontSize: _size.width / 26.5,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 4.0,
                ),
                Icon(
                  Feather.arrow_right,
                  color: Colors.blueAccent,
                  size: _size.width / 20.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
