import 'package:flutter/material.dart';


class  AboutPage  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('PayPage'),
        ),
        body: new Container(
          width: MediaQuery.of(context).size.width ,
          height: MediaQuery.of(context).size.width / 4,
          decoration: new BoxDecoration(
            color: Colors.red,
            //设置Border属性给容器添加边框
            border: new Border.all(
              //为边框添加颜色
              color: Colors.yellow,
              width:MediaQuery.of(context).size.width,
            ),
          ),
//        child: ,
        )
    );
  }
}