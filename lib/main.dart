import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const TWO_PI = 3.14 * 2;
int max = 1200;
int _count = 1111;
int percentage = ((_count / max) * 100).ceil();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'Controle de Acesso',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final size = 200.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff3b57f4),
        body: Container(
            child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'CONTROLE DE ACESSO',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 30,
                      color: const Color(0xfffcfeff),
                      letterSpacing: 0.75,
                      fontWeight: FontWeight.w900,
                      height: 1.9,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 25, 0, 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: size,
                    height: size,
                    child: TweenAnimationBuilder(
                        tween: Tween(begin: 0.0, end: (_count * 1) / max),
                        duration: Duration(seconds: 4),
                        builder: (context, value, child) {
                          // percentage to show in Center Text

                          return Container(
                            width: size,
                            height: size,
                            child: Stack(
                              children: [
                                ShaderMask(
                                  shaderCallback: (rect) {
                                    return SweepGradient(
                                        startAngle: 0.0,
                                        endAngle: TWO_PI,
                                        stops: [
                                          value,
                                          value
                                        ], // value from Tween Animation Builder
                                        // 0.0 , 0.5 , 0.5 , 1.0
                                        center: Alignment.center,
                                        colors: [
                                          Color(0xff070E82),
                                          Colors.white,
                                        ]).createShader(rect);
                                  },
                                  child: Container(
                                    width: size,
                                    height: size,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    width: size - 40,
                                    height: size - 40,
                                    decoration: BoxDecoration(
                                        color: Color(0xff3b57f4),
                                        shape: BoxShape.circle),
                                    child: Center(
                                      child: Text(
                                        "$_count",
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontSize: 50,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox.fromSize(
                      size: Size(190, 150),
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Capacidade maxima de segurança:',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 16,
                                      color: const Color(0xff3b57f4),
                                      letterSpacing: 0.375,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center),
                                Text(
                                  "$max",
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 50,
                                      color: const Color(0xff3b57f4),
                                      fontWeight: FontWeight.bold,
                                      height: 1),
                                ),
                                Text(
                                  "Pessoas",
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 20,
                                      color: const Color(0xff3b57f4),
                                      letterSpacing: 2,
                                      height: 0.8),
                                  textAlign: TextAlign.center,
                                ),
                              ]))),
                  SizedBox.fromSize(
                      size: Size(190, 150),
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Estamos com:',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 20,
                                      color: const Color(0xff3b57f4),
                                      letterSpacing: 0.375,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center),
                                Text(
                                  "$percentage%",
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 50,
                                      color: const Color(0xff3b57f4),
                                      fontWeight: FontWeight.bold,
                                      height: 1.3),
                                ),
                                Text(
                                  "Capacidade",
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 20,
                                      color: const Color(0xff3b57f4),
                                      letterSpacing: 2,
                                      height: 0.8),
                                  textAlign: TextAlign.center,
                                ),
                              ]))),
                ],
              ),
            ),
            ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 120,
                ),
                child: Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Aviso:',
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 18,
                                  color: const Color(0xff3b57f4),
                                  letterSpacing: 0.375,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.left)),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "asuausahh auhsuahs sauh asuagsagiysgYGS AUSUAGSUASUAH",
                          style: TextStyle(
                              fontSize: 20,
                              color: const Color(0xff3b57f4),
                              fontWeight: FontWeight.bold,
                              height: 1.3),
                          maxLines: 2,
                        ),
                      ),
                    ]))),
            new Container(
              padding: EdgeInsets.only(top: 20),
              child: new Center(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new FloatingActionButton(
                      onPressed: add,
                      child: new Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.white,
                    ),
                    new FloatingActionButton(
                      onPressed: minus,
                      child: new Icon(
                        Icons.remove,
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        )));
  }

  void add() {
    setState(() {
      _count++;
      porcento();
    });
  }

  void minus() {
    setState(() {
      if (_count != 0) _count--;
      porcento();
    });
  }

  void porcento() {
    setState(() {
      percentage = ((_count / max) * 100).ceil();
    });
  }
}
