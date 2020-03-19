import 'package:flutter/material.dart';
import 'jsonquestoes.dart';
import 'questoes.dart';
import 'api.dart';

class BuildListView extends StatefulWidget {
  @override
  _BuildListViewState createState() => _BuildListViewState();
}


class _BuildListViewState extends State<BuildListView> {
  //int _counter = 0;

  //void _incrementCounter()=> setState(() {
    //_counter++;
  //});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
          Text('Abra para resolver a questão'),
        ),
        body:ListView(
          children: <Widget>[
            //Card(child: ListTile(title: Text('One-line ListTile'))),
            Card(
              child: ListTile(
                leading: Icon(Icons.arrow_forward_ios),
                title: Text('QUESTÃO DE NÚMERO 1'),
                trailing: Icon(Icons.radio_button_unchecked),
                onTap: (){

                  //_counter++;
                  //debugPrint('$_counter');
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListQuestoes()));},
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.arrow_forward_ios),
                //leading: const Image(image: NetworkImage('https://i.imgur.com/lwKJCar.png'),),
                title: Text('QUESTÃO DE NÚMERO  2'),
                trailing: Icon(Icons.radio_button_unchecked),
              ),
            ),
            Card(
              child: ListTile(
                //leading: const Image(image: NetworkImage('https://i.imgur.com/lwKJCar.png'),),
                leading: Icon(Icons.arrow_forward_ios),
                title: Text('QUESTÃO DE NÚMERO  3'),
                trailing: Icon(Icons.radio_button_unchecked),
              ),
            ),
            Card(
              child: ListTile(
                //leading: const Image(image: NetworkImage('https://i.imgur.com/lwKJCar.png'),),
                leading: Icon(Icons.arrow_forward_ios),
                title: Text('QUESTÃO DE NÚMERO 4'),
                trailing: Icon(Icons.radio_button_unchecked),
              ),
            ),
            Card(
              child: ListTile(
                //leading: const Image(image: NetworkImage('https://i.imgur.com/lwKJCar.png'),),
                leading: Icon(Icons.arrow_forward_ios),
                title: Text('QUESTÃO DE NÚMERO 5'),
                trailing: Icon(Icons.radio_button_unchecked),
              ),
            ),
            Card(
              child: ListTile(
                //leading: const Image(image: NetworkImage('https://i.imgur.com/lwKJCar.png'),),
                leading: Icon(Icons.arrow_forward_ios),
                title: Text('QUESTÃO DE NÚMERO 6'),
                trailing: Icon(Icons.radio_button_unchecked),
              ),
            ),
            Card(
              child: ListTile(
                //leading: const Image(image: NetworkImage('https://i.imgur.com/lwKJCar.png'),),
                leading: Icon(Icons.arrow_forward_ios),
                title: Text('QUESTÃO DE NÚMERO 7'),
                trailing: Icon(Icons.radio_button_unchecked),
              ),
            ),
            Card(
              child: ListTile(
                //leading: const Image(image: NetworkImage('https://i.imgur.com/lwKJCar.png'),),
                leading: Icon(Icons.arrow_forward_ios),
                title: Text('QUESTÃO DE NÚMERO 8'),
                trailing: Icon(Icons.radio_button_unchecked),
              ),
            ),
            Card(
              child: ListTile(
                //leading: const Image(image: NetworkImage('https://i.imgur.com/lwKJCar.png'),),
                leading: Icon(Icons.arrow_forward_ios),
                title: Text('QUESTÃO DE NÚMERO 9'),
                trailing: Icon(Icons.radio_button_unchecked),
              ),
            ),
            Card(
              child: ListTile(
                //leading: const Image(image: NetworkImage('https://i.imgur.com/lwKJCar.png'),),
                leading: Icon(Icons.arrow_forward_ios),
                title: Text('QUESTÃO DE NÚMERO 10'),
                trailing: Icon(Icons.radio_button_unchecked),
              ),
            ),
          ],
        )
    );
  }
}
