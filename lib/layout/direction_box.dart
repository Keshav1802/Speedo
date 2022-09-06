import 'package:flutter/material.dart';
class DirectionBox extends StatefulWidget {
  const DirectionBox({Key key}) : super(key: key);

  @override
  State<DirectionBox> createState() => _DirectionBoxState();
}

class _DirectionBoxState extends State<DirectionBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/img_12.png'),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/img_12.png'),
                        ),
                      ),
                    ),
                    Column(

                    ),
                  ],
                ),
              ],
      ),
    );
  }
}
