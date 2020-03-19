import 'package:flutter/material.dart';
import 'questoes.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;

void main() => runApp(MyEdsoculos());

class MyEdsoculos extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EDS TEST APK',
      theme: ThemeData(
//        primarySwatch: Colors.red,
        primaryTextTheme: TextTheme(
            // ignore: deprecated_member_use
            title: TextStyle(
                color: Colors.blue
            )
        ),
        brightness: Brightness.dark,
        backgroundColor: Colors.black26,
      ),
      home: MyHomePage(title: ' Prova EDS'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
        Text(widget.title,),
      ),
      body: new Padding(

        padding: const EdgeInsets.all(30.0),

        child:new Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
//            new Container(height: 30.0,),
//            new Container(height: 30.0,),
            Image.asset('assets/images/teste-png-1.png', height: 150, width: 150,),
            new Row(

              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              ],
            ),

//            new Container(height: 30.0,),
//            new Container(height: 30.0,),
//            new Container(height: 30.0,),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/sv.png', height: 90, width: 20,),
                FlatButton(
                  onPressed: () {
                    //print("Clicou no Botão IP");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListQuestoes()),
                    );
                  },
                  child: Text('Iniciar Prova', style: TextStyle(
                      fontSize: 20.0, color: Colors.blue
                  )
                  ),
                  //textColor: MyColor.white,
                  shape: RoundedRectangleBorder(side: BorderSide(
                    color: Colors.blue,
                    width: 1,
                    style: BorderStyle.solid,

                  ), borderRadius: BorderRadius.circular(90)),
                ),
                Image.asset('assets/images/sv.png', height: 90, width: 20,),
                FlatButton(
                  onPressed: () {
                    //print("Clicou no Botão RP");
                  },
                  child: Text("Resultado", style: TextStyle(
                      fontSize: 20.0, color: Colors.blue
                  )
                  ),
                  //textColor: MyColor.white,
                  shape: RoundedRectangleBorder(side: BorderSide(
                    color: Colors.blue,
                    width: 1,
                    style: BorderStyle.solid,

                  ), borderRadius: BorderRadius.circular(90)),
                ),
                Image.asset('assets/images/sv.png', height: 90, width: 20,),
              ],
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

