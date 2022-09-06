import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class HomeDrawer extends StatefulWidget {

  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: [
            Stack(
              children:<Widget>[
                Container(
                    width: 400,
                    height: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/img_4.png'),
                          fit: BoxFit.fill,
                        )
                    ),
                    child: Text('Speedo',
                            style: TextStyle(fontSize: 24.0,color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                ),
                Positioned(
                  bottom: 50.0,
                  right: 100.0,
                  child: Container(
                    height: 400.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200.0),
                        color: Color(0x00FEE16D),
                  ),
                    child: Text('hello'),
                ),

              //   UserAccountsDrawerHeader(
              //   decoration: BoxDecoration(
              //       image: const DecorationImage(
              //         image: AssetImage('assets/images/img_4.png'),
              //         fit: BoxFit.fill,
              //       )
              //   ),
              //
              //   accountName: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.end,
              //     children: <Widget>[
              //       GestureDetector(
              //         onTap: () {},
              //         child: Container(
              //           child: ClipOval(
              //             // child: Image.asset(
              //             //   Images.Splash_Logo,
              //             //   width: 60,
              //             //   height: 60,
              //             //   fit: BoxFit.cover,
              //             // ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              //   accountEmail: Center(child: Text("jason dsilva")),
              //   currentAccountPicture: null,
              // ),
                )],),
          ],
        ),
        SizedBox(height: 70,),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          linkMenuDrawer(
            context,
            "RIDE HISTORY",
          ),
          SizedBox(height: 20,),
          linkMenuDrawer(
            context,
            'PROMOCODE',
          ),
          SizedBox(height: 20,),
          linkMenuDrawer(
            context,
            'SUPPORT',
          ),
          SizedBox(height: 20,),
          linkMenuDrawer(
            context,
            'TERMS OF SERVICE',
          ),
          SizedBox(height: 20,),
          linkMenuDrawer(
            context,
            'PRIVACY POLICY',
          ),
        ]),
        SizedBox(height: 150,),
        Container(
          child: Row(
            children: <Widget>[
              SizedBox(width: 5,),
              Text('App Version - V3.00',
                style: TextStyle(fontWeight: FontWeight.w500),),
              SizedBox(width: 50,),
              MaterialButton(
                hoverColor: Colors.grey,
                padding: EdgeInsets.all(8.0),
                textColor: Colors.white,
                elevation: 10.0,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/img_6.png'),
                    scale: 30.0,
                    fit: BoxFit.fill
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20,0,0,0),
                    child: Text("Logout",
                    style: TextStyle(fontSize: 28),),
                  ),
                ),
                // ),
                onPressed: () {
                  HapticFeedback.heavyImpact();
                  print('Tapped');
                },
              ),
            ],

    )
            )

      ],
    );
  }
}

Widget linkMenuDrawer(BuildContext context, String title,) {
  // return InkWell(
  //   onTap: () {
  //     Future.delayed(Duration.zero, () {
  //       openDrawerItems(context, title);
  //     });
  //   },
    return MaterialButton(
      onPressed: (){
        Future.delayed(Duration.zero, () {
          openDrawerItems(context, title);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );

}

void openDrawerItems(BuildContext context, String DrawerItemName) {
  final List<String> arr_drawer_items = [
    'RIDE HISTORY',
    'PROMOCODE',
    'SUPPORT',
    'TERMS OF SERVICE',
    'PRIVACY POLICY'
  ];
  if ("RIDE HISTORY".toLowerCase() == DrawerItemName.toLowerCase()) {
    Future.delayed(Duration.zero, () {
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (BuildContext context) => ProfileWidget()));
      print('Tapped');
    });
  }
  else if ("PROMOCODE".toLowerCase() == DrawerItemName.toLowerCase()) {
    Future.delayed(Duration.zero, () {
    // Navigator.of(context).push(MaterialPageRoute(
    //     builder: (BuildContext context) => ProfileWidget()));
      print('Tapped');
  });
  }
  else if ("SUPPORT".toLowerCase() == DrawerItemName.toLowerCase()) {
    Future.delayed(Duration.zero, () {
    // Navigator.of(context).push(MaterialPageRoute(
    //     builder: (BuildContext context) => ProfileWidget()));
      print('Tapped');
  });
  }
  else if ("TERMS OF SERVICE".toLowerCase() == DrawerItemName.toLowerCase()) {
    Future.delayed(Duration.zero, () {
    // Navigator.of(context).push(MaterialPageRoute(
    //     builder: (BuildContext context) => ProfileWidget()));
      print('Tapped');
  });
  }
  else if ("PRIVACY POLICY".toLowerCase() == DrawerItemName.toLowerCase()) {
    Future.delayed(Duration.zero, () {
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (BuildContext context) => ProfileWidget()));
      print('Tapped');
    });
  }
}
