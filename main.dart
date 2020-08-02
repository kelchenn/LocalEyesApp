import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home()
  ));


}



class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LocalEyes"),
          centerTitle: true,
          backgroundColor: Colors.indigo[900],
        leading: IconButton(
          onPressed: (){}, ///add code here
            icon:Icon(
            Icons.arrow_back,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.remove_red_eye,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 30.0, top: 15.0),
            child: Text(
              '0',
              style: TextStyle(
                fontSize: 20.0,
              )
            ), ///change this to a variable

          )
        ]
      ),
      body: Center(

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                Center(
                  child: Text(
                        'LocalEyes:',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan[600],
                        )
                    ),
                ),

              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 50.0),
                  child: Text(
                      'Word Games',
                      style: TextStyle(
                        fontSize: 43.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan[600],
                      )
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(bottom: 20.0),
                height: 70.0,
                child: FlatButton(
                  onPressed: () {}, ///add code here
                  child: Text(
                      'About LocalEyes',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                  ),
                  color: Colors.indigo[900],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20.0),
                height: 70.0,
                child: FlatButton(
                  onPressed: () {}, ///add code here
                  child: Text(
                    'Choose Local Business',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    )
                  ),
                  color: Colors.cyan[600],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20.0),
                height: 70.0,
                child: FlatButton(
                  onPressed: () {}, ///add code here
                  child: Text(
                      'Play',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      )
                  ),
                  color: Colors.cyan[200]
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20.0),
                height: 70.0,
                child: FlatButton(
                  onPressed: () {}, ///add code here
                  child: Text(
                      'Rewards',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      )
                  ),
                  color: Colors.blueGrey[100],

                ),
              ),
            ]
          ),
        ),
      ),
    );

          /*child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
          color: Colors.blue,
        )
          child: RaisedButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.remove_red_eye,
          ),
          label: Text("hi"),
          color: Colors.amber,
        )
        */

  }
}