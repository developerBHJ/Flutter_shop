import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_page.dart';
import 'cart_page.dart';
import 'category_page.dart';
import 'member_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

    final List<BottomNavigationBarItem> bottomTabs = [
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home),
        title: Text('首页')
      ),
      BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.search),
          title: Text('分类')
      ),
      BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.shopping_cart),
          title: Text('购物车')
      ),
      BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.profile_circled),
          title: Text('我的')
      ),
    ];

    final List <Widget> tabBodies = [
      HomePage(),
      CategoryPage(),
      ShoppingCarPage(),
      MemberPage()
    ];

    int currentIndex = 0;
    var currentPage;

    @override
    void initState(){
      currentPage = tabBodies[currentIndex];
      super.initState();
    }

    @override
   Widget build(BuildContext context){
      ScreenUtil.init(context,designSize: Size(750, 1334));
      return Scaffold(
        backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
        bottomNavigationBar: BottomNavigationBar(
            items: bottomTabs,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index){
              setState(() {
                currentIndex = index;
                currentPage = bottomTabs[currentIndex];
              });
            },
        ),
        body: IndexedStack(
          index: currentIndex,
          children: tabBodies,
        ),
      );
    }
}