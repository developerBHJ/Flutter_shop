import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/services/service_method.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_shop/router/application.dart';
import 'package:flutter_screenutil/screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

/*
添加AutomaticKeepAliveClientMixin 切换Tab后保留tab的状态，防止initState方法重复调用
并实现对应的方法bool get wantKeepAlive => true;
同时build方法实现父方法 super.build(context)
 */
class _HomePageState extends State<HomePage>
with AutomaticKeepAliveClientMixin{

  int page = 0;
  List <Map> hotGoodsList = [{'mallPrice':'98.00','price':'109.00','image':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1602333003337&di=99fdfced0e170290b1f02d83636e06b1&imgtype=0&src=http%3A%2F%2Fpics3.baidu.com%2Ffeed%2F64380cd7912397dd19e8cdd190b538b1d1a28714.jpeg%3Ftoken%3D81c987e5c8f38a1cf5f1d72bc3518834','name':'红心柚','goodsId':'0010'}];
  String homePageContent = '正在获取数据';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var paramater = {'lon': '115.02932','lat':'35.76189'};

    return Scaffold(
      appBar: AppBar(title: Text('百姓生活+'),),
      body: _hotGoods(),
      /*
      FutureBuilder：Widget that builds itself based on the latest snapshot of interaction with a Future.
      带加载动画的控件 大致就是 加载数据之前返回一个组件，加载完数据之后返回另外一个组件
       */
      // body: FutureBuilder(
      //     future: request('homePageContent',pragma: paramater),
      //     // ignore: missing_return
      //     builder: (context,snapshot){
      //           if(snapshot.hasData){
      //           var data = json.decode(snapshot.data.toString());
      //           List <Map> swiper = (data['data']['sliders'] as List).cast();
      //           (data['data']['category'] as List).cast();
      //           String adPicture =
      //           data['data']['advertesPicture']['PICTURE_ADDRESS'];
      //           String leaderImage = data['data']['shopInfo']['leaderImage'];
      //           String leaderPhone = data['data']['shopInfo']['leaderPhone'];
      //           List<Map> recommendList = (data['data']['recommend'] as List).cast();
      //           String floor1Title = data['data']['floor1Pic']['PICTURE_ADDRESS'];
      //           String floor2Title = data['data']['floor2Pic']['PICTURE_ADDRESS'];
      //           String floor3Title = data['data']['floor3Pic']['PICTURE_ADDRESS'];
      //           List<Map> floor1 = (data['data']['floor1'] as List).cast();
      //           List<Map> floor2 = (data['data']['floor2'] as List).cast();
      //           List<Map> floor3 = (data['data']['floor3'] as List).cast();
      //           return EasyRefresh(
      //             footer: ClassicalFooter(
      //                 bgColor: Colors.white,
      //                 textColor: Colors.black,
      //                 noMoreText: '',
      //                 infoText: '加载中222...',
      //               infoColor: Colors.pink,
      //               showInfo: true,
      //               loadReadyText: '上拉加载'
      //             ),
      //               child:ListView(
      //                 children: <Widget>[
      //                   _hotGoods()
      //                 ],
      //               ),
      //             onLoad: () async { // 加载更多
      //               var formData = {'page': page};
      //               await request('homePageBelowConten',pragma: formData).then((value) => {
      //
      //             });
      //             },
      //           );
      //           }else{
      //             return Center(
      //               child: Text('加载中111...'),
      //             );
      //           }
      //     }),
    );
  }

  // 火爆商品标题
  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
    alignment: Alignment.center,
    color: Colors.transparent,
    child: Text('火爆专区',style: TextStyle(fontSize: ScreenUtil().setSp(30),fontWeight: FontWeight.bold),),
    padding: EdgeInsets.all(5.0),
  );

  // 火爆专区商品
  Widget _warpList(){
    if(hotGoodsList.length != 0){
      List<Widget> listWidget = hotGoodsList.map((e){
        return InkWell(
          onTap: (){
          Application.router.navigateTo(context, "./detail?id=${e['goodsId']}");
          },
          child: Container(
            child: Column(
              children: <Widget>[
                Image.network(e['image'],width: ScreenUtil().setWidth(375),),
                Text(
                  e['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.pink,fontSize: ScreenUtil().setSp(26)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text('￥${e['mallPrice']}'),
                      margin: EdgeInsets.only(left: 15),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: Text('￥${e['price']}',style: TextStyle(color: Colors.black26,decoration: TextDecoration.lineThrough),),
                    )
                  ],
                )
              ],
            ),
          ),
      );
      }).toList();
      return Wrap(spacing: 2,children: listWidget,);
    }else{
      return Text('');
    }
  }

  Widget _hotGoods(){
    return Container(
      child: Column(
        children: [hotTitle,_warpList()],
      ),
    );
  }
}
// 轮播图
class Banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



