// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speedo/auth/login.dart';

import '../resources/images.dart';
import '../resources/strings.dart';
import '../routes/routes.dart';

class IntroWidget extends StatefulWidget {
  const IntroWidget({Key key}) : super(key: key);

  @override
  State<IntroWidget> createState() => _IntroWidgetState();
}

class _IntroWidgetState extends State<IntroWidget> {
  PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
        initialPage: 0
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: 300,
      width: 300,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffffc000),
              Color(0xff212529),
            ],
          )
      ),
      child: Scaffold(
        backgroundColor: const Color(0x00ffc000),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                child: const Text('Skip', style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                ),),
              ),
            )
          ],
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[

            PageView(
              onPageChanged: (int page) {
                setState(() {
                  currentIndex = page;
                });
              },
              controller: _pageController,
              children: <Widget>[
                makePage(
                    image: Images.Intro_Img1,
                    title: Strings.IntroTitle,
                ),
                makePage(
                    reverse: false,
                    image:  Images.Intro_Img2,
                    title: Strings.IntroTitle,
                ),
                makePage(
                  reverse: false,
                  image:  Images.Intro_Img3,
                  title: Strings.IntroTitle,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 150),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildIndicator(),
              ),
            ),
            // SizedBox(height: 10,),
            Container(
              width: mediaQuery.width * 0.9,
              margin: const EdgeInsets.only(bottom: 40),
              child: ElevatedButton(
                onPressed: () async{
                  // Navigator.pushReplacementNamed(context, Routes.login);
                  await Future.delayed(Duration(milliseconds: 100));
                  Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(fullscreenDialog: true,builder: (context) => LoginScreen()),
                        (Route<dynamic> route) => false,
                  );
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                child: const Icon(Icons.arrow_forward,color: Colors.black,),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(const CircleBorder()),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                  backgroundColor: MaterialStateProperty.all(const Color(0x00ffffff)), // <-- Button color
                  overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.pressed)) return Colors.white;
                    return null; // <-- Splash color
                  }),
                ),
              )
            )
          ],
        ),
      ),
    );
  }

  Widget makePage({image, title, content, reverse = false}) {
    return Stack(
      children: <Widget>[

        Container(
        padding: const EdgeInsets.only(left: 50, right: 50, bottom: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            !reverse ?
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child:
                  Image.asset(
                    image,),
                ),
                const SizedBox(height: 20),
              ],
            ) : const SizedBox(),
            Text(title, style: const TextStyle(
                color: Colors.grey,
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),),
            const SizedBox(height: 10),
            // Text(content, textAlign: TextAlign.center, style: const TextStyle(
            //     color: Colors.black,
            //     fontSize: 20,
            //     fontWeight: FontWeight.w400
            // ),),
            reverse ?
            Column(
              children: <Widget>[
                const SizedBox(height: 20),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset(image),
                ),
              ],
            ) :const SizedBox(),
          ],
        ),
      ),
    ]);
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration:const Duration(milliseconds: 50),
      height: 6,
      width: isActive ? 30 : 6,
      margin:const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.blue[400],
          borderRadius: BorderRadius.circular(5)
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i<3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}
