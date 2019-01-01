import 'package:exec/util/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:exec/global_config.dart';
//import '../home/search_page.dart';

class LearnPage extends StatefulWidget {

  @override
  _LearnPageState createState() => new _LearnPageState();

}

class _LearnPageState extends State<LearnPage> {


  Widget barSearch() {
    return  Container(
        height: 38.0,
        margin: const EdgeInsets.only(top: 6.0,bottom: 6.0,left: 10.0,right: 10.0),
        child: FlatButton(
            onPressed: (){
//              Navigator.of(context).push(new MaterialPageRoute(
//                  builder: (context) {
//                    return new SearchPage();
//                  }
//              ));
            },
            child:
                Center(
                 child: Row(
                   mainAxisSize: MainAxisSize.min,
                   children: <Widget>[
                     Container(
                       child:  Icon(Icons.search, size: 18.0,color: Colors.black26),
                       margin: const EdgeInsets.only(right: 26.0),
                     ),
                     Expanded(
                         child:  Container(
                           child:  Text("请输入搜索内容",style: new TextStyle(color: Colors.black26)),
                         )
                     )
                   ],
                 ) ,
               ),
        ),
        decoration: new BoxDecoration(
            borderRadius: const BorderRadius.all(const Radius.circular(25.0)),
            color: GlobalConfig.searchBackgroundColor
        )
    );
  }


  Widget LearnIcon({rowNum:int,icon:Icon,title:String,route:Widget}) {
    return  Container(
      width: MediaQuery.of(context).size.width / rowNum,//宽度按比例切割
      child:  GestureDetector(
          onTap: () {//如果Widget不支持事件监听，则可以将该Widget包装到GestureDetector中

          },
          child:  Container(
            child:  Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                 Container(
                  margin: const EdgeInsets.only(bottom: 6.0),
                  child:  icon,
                ),
                 Container(
                  child:  Text(title, style:  TextStyle(color: GlobalConfig.fontColorDark, fontSize: 12.0)),
                )
              ],
            ),
          )
      ),
    );
  }
  Widget LearnModuleCard() {
    return  Container(

      margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
      padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
      child:  Column(
        children: <Widget>[
           Container(
            color: GlobalConfig.cardBackgroundColor,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
               LearnIcon(rowNum:5,icon:new Icon(IconData(0xe693, fontFamily: "iconfont"), color: ThemeUtils.currentColorTheme),title:'课程中心'),
               LearnIcon(rowNum:5,icon:new Icon(IconData(0xe694, fontFamily: "iconfont"), color: ThemeUtils.currentColorTheme),title:'考试任务'),
               LearnIcon(rowNum:5,icon:new Icon(IconData(0xe697, fontFamily: "iconfont"), color: ThemeUtils.currentColorTheme),title:'问答社区'),
               LearnIcon(rowNum:5,icon:new Icon(IconData(0xe69d, fontFamily: "iconfont"), color: ThemeUtils.currentColorTheme),title:'知识库'),
               LearnIcon(rowNum:5,icon:new Icon(IconData(0xe692, fontFamily: "iconfont"), color: ThemeUtils.currentColorTheme),title:'培训班'),

//               LearnIcon(rowNum:5,icon:new Icon(Icons.exe-study-centre, color: ThemeUtils.currentColorTheme),title:'考试任务'),
//               LearnIcon(rowNum:5,icon:new Icon(Icons.exe-study-exam, color: ThemeUtils.currentColorTheme),title:'考试任务'),
//               LearnIcon(rowNum:5,icon:new Icon(Icons.exe-study-answer, color: ThemeUtils.currentColorTheme),title:'问答社区'),
//               LearnIcon(rowNum:5,icon:new Icon(Icons.exe-knowledge-all, color: ThemeUtils.currentColorTheme),title:'知识库'),
//               LearnIcon(rowNum:5,icon:new Icon(Icons.exe-study-train, color: ThemeUtils.currentColorTheme),title:'培训班'),
              ],
            ),
          ),

          new Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                LearnIcon(rowNum:5,icon:new Icon(IconData(0xe696, fontFamily: "iconfont"), color: ThemeUtils.currentColorTheme),title:'学习地图'),
                LearnIcon(rowNum:5,icon:new Icon(IconData(0xe68f, fontFamily: "iconfont"), color: ThemeUtils.currentColorTheme),title:'胜任力任务'),
                LearnIcon(rowNum:5,icon:new Icon(IconData(0xe691, fontFamily: "iconfont"), color: ThemeUtils.currentColorTheme),title:'讲师库'),
                LearnIcon(rowNum:5,icon:new Icon(IconData(0xe690, fontFamily: "iconfont"), color: Colors.grey),title:'管理'),
//                LearnIcon(rowNum:5,icon:new Icon(IconData(0xe694, fontFamily: "iconfont"), color: ThemeUtils.currentColorTheme),title:'收起'),

//                LearnIcon(rowNum:5,icon:new Icon(Icons.exe-study-maps, color: ThemeUtils.currentColorTheme),title:'学习地图'),
//                LearnIcon(rowNum:5,icon:new Icon(Icons.exe-study-competency, color: ThemeUtils.currentColorTheme),title:'胜任力任务'),
//                LearnIcon(rowNum:5,icon:new Icon(Icons.exe-study-teacher, color: ThemeUtils.currentColorTheme),title:'讲师库'),
//                LearnIcon(rowNum:5,icon:new Icon(Icons.exe-study-management, color: Colors.grey),title:'管理'),
//                LearnIcon(rowNum:5,icon:new Icon(Icons.free_breakfast, color: ThemeUtils.currentColorTheme),title:'收起'),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget LearnPlanCard() {
    return null;
  }
  Widget CourseListCard() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: GlobalConfig.themeData,
      home: new Scaffold(
          appBar: new AppBar(
            centerTitle: true,
            title: Text('学习', style: new TextStyle(color: Colors.white)),
          ),
          body: new SingleChildScrollView(
            child: new Container(
              child: new Column(
                children: <Widget>[
                  barSearch(),
                  LearnModuleCard(),
//                  LearnPlanCard(),
//                  CourseListCard()
                ],
              ),
            ),
          )
      ),
    );
  }

}