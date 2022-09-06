import 'package:flutter/material.dart';

class KPIWidget extends StatefulWidget {
  KPIWidget({@required this.name, @required this.child,});

  final String name;
  final Widget child;

  @override
  State<KPIWidget> createState() => _KPIWidgetState();
}

class _KPIWidgetState extends State<KPIWidget> {
  bool _hasBeenPressed = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          setState(() {
            _hasBeenPressed = !_hasBeenPressed;
          });
        },
        // color: _hasBeenPressed ? Colors.yellowAccent : Colors.white,
        // focusColor:_hasBeenPressed ? Colors.yellowAccent : Colors.white ,
        child: Container(
              width: 0.23 * MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(

                        // gradient: LinearGradient(
                        //   colors: [
                        //     Colors.white, Color(0xffeef9ff)
                        //   ],
                        //   begin: Alignment.topCenter,
                        //   end: Alignment.bottomCenter,
                        // ),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            blurRadius: 40,
                            color: Colors.grey.shade300,
                          )
                        ]),
                    child: this.widget.child,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 6),
                      child:
                          Text(this.widget.name, style: TextStyle(color: Colors.black)))
                ],
              )),
      ),
    );
  }
}
