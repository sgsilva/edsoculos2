import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'main.dart';
import 'api.dart';
import 'jsonquestoes.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;


class ListQuestoes extends StatefulWidget {
  @override
  _ListQuestoesState createState() => _ListQuestoesState();
}

class _ListQuestoesState extends State<ListQuestoes> {

  var users = new List<Questoes>();
  bool pressed3 = true;
  bool pressed1 = true;
  bool pressed2 = true;
  int count = 0;


//confs do Alerta
  var alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
      side: BorderSide(
        color: Colors.black,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.red,
    ),
  );



  _getUsers() async  {
    await API.getUsers().then((response){
      setState(() {
        Iterable lista = json.decode(response.body);
        users = lista.map((model) => Questoes.fromJson(model)).toList();
      });
    });
  }

  @override
  // ignore: must_call_super
  void initState() {
    _getUsers();
    count=0;
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar : AppBar(
        title: Text("Marque a opção correta."),
        leading: new IconButton(
          icon: new Icon(Icons.done_all),
        ),
      ),
      body: ListView.builder(
        itemCount : 1,
        itemBuilder: (context, index) {
          if(users.isEmpty) {
            return Container(
              child: CircularProgressIndicator(),
              width: 25,
              height: 25,
            );
          }else {
            return Card(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(users[index+count].question, style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),),
                    new Container(height: 30.0,),
                    new Column(
                      //mainAxisSize: MainAxisSize.max,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new FlatButton(
                          child: Text("( A ) - "+users[index+count].options[0],
                            style: pressed3
                                ? TextStyle(color: Colors.white,fontSize: 15)
                                : TextStyle(color:Colors.green,fontSize: 16),),
                          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(90)),
                          onPressed: () {
                            if(users[index+count].options.elementAt(0).compareTo(users[index+count].answer) == 0){ print("Verificar se está correta!");}
                            //users[index+count].escolhido =pressed3;
                            setState(() {
                              if(pressed3 == true){pressed3 =false; pressed2 = true; pressed1 = true;}

                            });
                          },
                        ),
                        new FlatButton(
                          child: Text("( B ) - "+users[index+count].options[1],
                            style: pressed2
                                ? TextStyle(color: Colors.white,fontSize: 15)
                                : TextStyle(color:Colors.green,fontSize: 16),),
                          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(90)),
                          onPressed: () {
                           // users[index+count].escolhido =pressed2;
                            if(users[index+count].options.elementAt(1).compareTo(users[index+count].answer) == 0){ print("Verificar se está correta!");}
                            setState(() {
                              if(pressed2 == true){pressed2 = false; pressed3 = true; pressed1 = true;}
                            });
                          },
                        ),
                        new FlatButton(
                          child: Text("( C ) - "+users[index+count].options[2],
                            style: pressed1
                                ? TextStyle(color: Colors.white,fontSize: 15)
                                : TextStyle(color:Colors.green,fontSize: 16),),
                          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(90)),
                          onPressed: () {
                            if(users[index+count].options.elementAt(2).compareTo(users[index+count].answer) == 0){ print("Verificar se está correta!");}
                            //users[index+count].escolhido =pressed1;
                            setState(() {
                              if(pressed1 == true){pressed1 = false; pressed2 = true; pressed3 = true;}

                            });
                          },
                        ),
                      ],
                    ),
                    new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                       RaisedButton(
                        child: Text('Próxima'),
                        onPressed: () {

                          if ( pressed1 == true && pressed2 == true && pressed3 == true ) {
                            // alerta dialogo
                            Alert(
                              context: context,
                              style: alertStyle,
                              type: AlertType.info,
                              title: "ATENÇÂO",
                              desc: "É necessário marcar uma opção!",
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    "OK",
                                    style: TextStyle(color: Colors.white, fontSize: 15,),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop(null);
                                    },
                                  //color: Color.fromRGBO(0, 179, 134, 1.0),
                                  color: Colors.blue,
                                  radius: BorderRadius.circular(0.0),
                                ),
                              ],
                            ).show();
                          }
                          else{
                          pressed2 = true; pressed3 = true; pressed1 = true;
//                          if ( count >= 2 ) {
//                            //count = 0;
//                            // alerta dialogo
//                            Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();
//                          }
                          if(count <=1){
                          setState(() {
                              count++;
                          }
                          );}
                          else{
                            Alert(
                            context: context,
                            style: alertStyle,
                            type: AlertType.info,
                            title: "PARABENS",
                            desc: "PROVA FINALIZADA!",
                            buttons: [
                              DialogButton(

                                child: Text(
                                  "FECHAR",
                                  style: TextStyle(color: Colors.white, fontSize: 15,),
                                ),
//                                onPressed: ()=> finish();
                                onPressed: () {
                                  Navigator.popUntil(context,ModalRoute.withName('/'));
                                  },
                                //color: Color.fromRGBO(0, 179, 134, 1.0),
                                color: Colors.blue,
                                radius: BorderRadius.circular(0.0),
                              ),
                            ],
                          ).show();}
                        }},
                      ),
              ]
                    ),

                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

