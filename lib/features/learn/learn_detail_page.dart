import 'package:flutter/material.dart';


class  LearnDetailPage  extends StatelessWidget {
  Widget _buildText({String text, Color textColor = Colors
      .white, double size: 32.0, AlignmentDirectional align = AlignmentDirectional
      .center}) {
    return Container(
      alignment: align,
      color: Colors.white,
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: size),
        textAlign: TextAlign.center,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 60.0,
                child: _buildText(
                    text: '支付剩余时间',
                    textColor: Colors.black45,
                    size: 20.0,
                    align: AlignmentDirectional.bottomCenter),
              ),
              VerticalPadding(
                child: _buildText(text: '00:00',
                    textColor: Colors.black,
                    size: 36.0,
                    align: AlignmentDirectional.topCenter),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 0.5,
                  color: Colors.black38
              ),
              Container(
                color: Colors.white,
                child:
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 5.0),
                      alignment: AlignmentDirectional.center,
                      color: Colors.white,
                      child: Text(
                        '支付金额:',
                        style: TextStyle(color: Colors.black45, fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 5.0),
                      alignment: AlignmentDirectional.center,
                      color: Colors.white,
                      child: Text(
                        '0',
                        style: TextStyle(
                            color: Colors.orangeAccent, fontSize: 22.0),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: 5.0, horizontal: 5.0),
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  '选择支付方式',
                  style: TextStyle(color: Colors.black45, fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
              ),
              RadioList(),
              new Padding(
                padding: new EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 10.0),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new RaisedButton(
                          color: Theme.of(context).primaryColor,
                          child: new Text('确认支付',style: new TextStyle(color: Theme.of(context).buttonColor),),
                          onPressed: (){},
                        )
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }


}
class RadioList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RadioList();
  }
}

class _RadioList extends State<RadioList> {
  String _payChannl = '0';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[

            RadioListTile<String>(
              value: '0',
              title: Text('银联'),
              subtitle: Text('欢迎使用银联支付'),
              groupValue: _payChannl,
              //      secondary: Icon(Icons.radio_button_checked),
              selected:_payChannl=='0' ,
              onChanged: (value) {
                setState(() {
                  _payChannl = value;
                });
              },
            ),
            RadioListTile<String>(
              value: '1',
              title: Text('支付宝'),
              subtitle: Text('多付多赚'),
              groupValue: _payChannl,
              //  secondary: Icon(Icons.radio_button_unchecked),
              selected:_payChannl=='1' ,
              onChanged: (value) {
                setState(() {
                  _payChannl = value;
                });
              },
            ),
            RadioListTile<String>(
              value: '2',
              title: Text('微信'),
              subtitle: Text('方便快捷'),
              groupValue: _payChannl,
              selected:_payChannl=='2' ,
              //secondary: Icon(Icons.radio_button_unchecked),
              onChanged: (value) {
                setState(() {
                  _payChannl = value;
                });
              },
            ),
          ],
        ));
  }
}
class VerticalPadding extends StatelessWidget {
  VerticalPadding({
    @required this.child,
    this.padding = 16.0,
    this.color = Colors.white,
  });

  final double padding;
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: EdgeInsets.symmetric(vertical: padding),
      child: child,
    );
  }
}