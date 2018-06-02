import 'package:flutter/material.dart';
import 'package:desserts_app/dessert.dart';

void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.orange,
        buttonColor: Colors.orange,
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary
        )
      ),
      home: new MyHomePage(title: 'The Dessert Shop'),
    );
  }
}

final List<Dessert> _desserts = [
  Dessert(name: 'Cake', flavor: 'Mango and Strawberry',imageUrl: 'http://192.168.2.114:8000/cake.jpeg'),
  Dessert(name: 'Ice Cream', flavor: 'Chocolate and Vanilla ', imageUrl: 'http://192.168.2.114:8000/icecream.jpeg'),
  Dessert(name: 'Pancake',flavor: 'various' ,imageUrl: 'http://192.168.2.114:8000/pancake.jpeg'),
  Dessert(name: 'CupCake',flavor: 'tons of' ,imageUrl: 'http://192.168.2.114:8000/cupcake.jpeg'),
  Dessert(name: 'Donut',flavor:'Strawberry and Chocolate' ,imageUrl: 'http://192.168.2.114:8000/donut.jpeg'),
];

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key key, this.title}) : super(key: key);

  Widget _dialogBuilder(BuildContext context, Dessert dessert) {
    ThemeData localTheme = Theme.of(context);
    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: <Widget>[
        Image.network(
          dessert.imageUrl,
          fit: BoxFit.fill
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                  dessert.name,
                  style: localTheme.textTheme.display1,
              ),
              Text(
                  'Comes in ${dessert.flavor} flavors',
                style: localTheme.textTheme.subhead.copyWith(
                  fontStyle: FontStyle.italic
                ),
              ),
              SizedBox(height: 16.0,),
              Align(
                alignment: Alignment.centerRight,
                child: Wrap(
                  children: <Widget>[
                    FlatButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: Text('I am on a diet'),
                    ),
                    RaisedButton(
                      onPressed: (){},
                      child: Text('Order'),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (context) => _dialogBuilder(context, _desserts[index])),
      child: Container(
        padding: EdgeInsets.only(left: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(
          _desserts[index].name,
          style: Theme.of(context).textTheme.headline,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('The Dessert Shop'),
        ),
        body: ListView.builder(
          itemCount: _desserts.length,
          itemExtent: 60.0,
          itemBuilder: _listItemBuilder,
        ));
  }
}
