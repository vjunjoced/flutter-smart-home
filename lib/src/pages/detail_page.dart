import 'package:flutter/material.dart';
import 'package:smart_home_iot/src/app_colors.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  ScrollController _scrollController;
  bool _isScrolled = false;
  bool _showTitle = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_listenToScrollChange);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyColorDetails,
      body: CustomScrollView(
        controller: _scrollController,
        
        slivers: <Widget>[
          _appBar(context),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 20.0),
              _cntItems(),
              SizedBox(height: 40.0),
            ]),
          )
        ],
      ),
    );
  }

  Widget _cntItems() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          _item('Lamp', '65% Brightness', true),
          SizedBox(height: 18.0),
          _item('TV', '37% Volume', false),
          SizedBox(height: 18.0),
          _item('Air Conditioner', '24°C Temperature', true),
          SizedBox(height: 18.0),
          _item('Fridge', '5°C Temperature', true),
          SizedBox(height: 18.0),
          _item('CCTV Cam.', 'Left/Right : 96.4° & Up/Down : 86.2°', true),
          SizedBox(height: 18.0),
          _item('Fridge 2', '8°C Temperature', true),
          SizedBox(height: 18.0),
          _item('Fridge 3', '2°C Temperature', true),
        ],
      ),
    );
  }

  Widget _item(String name, String value, bool btn) {
    return Container(
      padding: EdgeInsets.only(
        top: 26.0,
        left: 26.0,
        bottom: 26.0,
        right: 16.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(14.0),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: AppColors.grey1Color,
            ),
            child: Center(
              child: Text(
                'IC',
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Container(
            width: 190.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$name',
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 6.0),
                Text(
                  '$value',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w300,
                    fontSize: 13.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Switch(
            activeColor: AppColors.mainColor,
            inactiveThumbColor: AppColors.grey1Color,
            inactiveTrackColor: AppColors.grey2Color,
            onChanged: (bool value) {},
            value: btn,
          ),
        ],
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return SliverAppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(_isScrolled ? 0 : 30),
        ),
      ),
      elevation: 0,
      backgroundColor: AppColors.mainColor,
      expandedHeight: 220.0,
      pinned: true,
      floating: true,
      leading: Transform.translate(
        offset: Offset(10, 0),
        child: BackButton(),
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        title: AnimatedOpacity(
          duration: Duration(milliseconds: 100),
          opacity: _showTitle ? 1.0 : 0.0,
          child: Text(
            'Bed Room',
          ),
        ),
        background: Container(
          padding: new EdgeInsets.only(top: 80.0, left: 30.0, right: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bed Room',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                '3 family members have access',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _itemStats(context, '', '24°C', 'TEMP'),
                  _itemStats(context, '', '50%', 'HUMIDITY'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemStats(
      BuildContext context, String img, String value, String text) {
    final double widthStats = (MediaQuery.of(context).size.width - 60) / 2;

    return Container(
      width: widthStats,
      child: Row(
        children: [
          Container(
            width: 54.0,
            height: 54.0,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.all(Radius.circular(27.0)),
            ),
            child:Center(
              child: Text(
                'IC',
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$value',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '$text',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 12.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _listenToScrollChange() {
    if (_scrollController.offset >= 132.0) {
      setState(() {
        _isScrolled = true;
      });
    } else {
      setState(() {
        _isScrolled = false;
      });
    }

    if (_scrollController.offset >= 165.0) {
      _showTitle = true;
    } else {
      _showTitle = false;
    }
  }

  dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
