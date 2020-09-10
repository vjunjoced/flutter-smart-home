import 'package:flutter/material.dart';
import 'package:smart_home_iot/src/app_colors.dart';

class DataItem {
  String name;
  int numberAccess;
  int device;
  bool btn;

  DataItem({this.name, this.numberAccess, this.device, this.btn});
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<DataItem> listItems = [
    DataItem(name: 'Living Room', btn: true, device: 3, numberAccess: 4),
    DataItem(name: 'Bed Room', btn: true, device: 5, numberAccess: 3),
    DataItem(name: 'Guest Room', btn: false, device: 3, numberAccess: 2),
    DataItem(name: 'Kitchen', btn: true, device: 4, numberAccess: 2),
    DataItem(name: 'Kids Room', btn: true, device: 4, numberAccess: 1),
    DataItem(name: 'Balcony', btn: true, device: 2, numberAccess: 4)
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _header(),
            _body(context),
          ],
        ),
        backgroundColor: AppColors.bodyColor,
        extendBody: true,
      ),
    );
  }

  Widget _body(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Positioned(
      top: 60,
      left: 0,
      child: Container(
        height: height - 130,
        child: Scrollbar(
          controller: ScrollController(),
          child: SingleChildScrollView(
            controller: ScrollController(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.0),
                _textHeader(),
                SizedBox(height: 36.0),
                _cntItems(context),
                SizedBox(height: 30.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textHeader() {
    return Container(
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi Samuel',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Welcome to home',
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Widget _cntItems(BuildContext context) {
    final List<Widget> list = [];
    final _width = (MediaQuery.of(context).size.width - 76) / 2;

    for (var i = 0; i < listItems.length; i++) {
      final rw = Row(
        children: [
          Container(
            width: _width,
            child: _item(context, listItems[i], i),
          ),
          SizedBox(width: 16.0),
          Container(
            width: _width,
            child: _item(context, listItems[i + 1], i + 1),
          ),
        ],
      );

      list.add(rw);
      list.add(SizedBox(height: 16.0));

      i++;
    }

    return Container(
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: list,
      ),
    );
  }

  Widget _item(BuildContext context, DataItem data, int index) {
    final padding = EdgeInsets.only(
      left: 22.0,
      right: 22.0,
    );

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'detail');
      },
      child: Container(
        padding: EdgeInsets.only(
          top: 20.0,
          bottom: 10.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: padding,
              child: Text(
                '${data.name}',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: padding,
              child: Text(
                '${data.numberAccess} family members have access',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: padding,
              child: Text(
                '${data.numberAccess} Devices',
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
              child: Switch(
                activeColor: AppColors.mainColor,
                inactiveThumbColor: AppColors.grey1Color,
                inactiveTrackColor: AppColors.grey2Color,
                onChanged: (bool value) {
                  setState(() {
                    data.btn = value;
                  });
                },
                value: data.btn,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        padding: EdgeInsets.only(left: 30.0, top: 10.0),
        child: Container(
          height: 50.0,
          width: 50.0,
          child: CircleAvatar(
            radius: 22.0,
            backgroundImage: NetworkImage('https://i.imgur.com/Ez4gMQI.png'),
          ),
        ),
      ),
    );
  }
}
