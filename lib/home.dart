import 'package:flutter/material.dart';


class home extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
   return new  homeState ();
  }

}

class homeState extends State<home> {

  final  TextEditingController ageController =new TextEditingController();
  final  TextEditingController heightController  =new TextEditingController();
  final  TextEditingController wtController  =new TextEditingController();
  double inches=0.0;
  double result=0.0;
  String r ="";
  String finalResult="";


void calculate(){
  setState(() {
int age= int.parse(ageController.text);
double ht=double.parse(heightController.text);
inches=ht*12;

double wt=double.parse(wtController.text);

if((ageController.text.isNotEmpty || age>0)
&& ((heightController.text.isNotEmpty || inches>0)
    && (wtController.text.isNotEmpty || wt>0))) {
  result = wt / (inches * inches) * 703;
  if(double.parse(result.toStringAsFixed(1))<18.5){
    r="under wt";
    print(r);
  }else if(double.parse(result.toStringAsFixed(1)) >= 18.5
  && result < 25){
    r="great Shape";
    print(r);
  }else if(double.parse(result.toStringAsFixed(1)) >= 25.0
  && result<30){
    r="overweight";
    print(r);

  }else if(double.parse(result.toStringAsFixed(1)) >= 30.0){
    r="obese";
    print(r);
  }
}else {
  result = 0.0;
}
  });
  finalResult="your BMI: ${result.toStringAsFixed(1)}";
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
backgroundColor: Colors.white,

      body: new Container(

        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset('images/img.png',
              height: 133.0,
            width:  200.0,),

            new Container(
              margin: const EdgeInsets.all(3.0),
              height: 245.0,
              width: 290.0,
              color: Colors.grey.shade300,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller:  ageController,
                      keyboardType: TextInputType.number,
                     decoration: new InputDecoration(
                       hintText: 'age',
                       icon: new Icon(Icons.person_outline)
                     ),
                  ),
                  new TextField(
                    controller: heightController ,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      hintText: 'height in feet',
                      icon: new Icon(Icons.insert_chart)
                    ),
                  ),
                  new TextField(
                    controller: wtController ,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        hintText: 'weight in lb',
                        icon: new Icon(Icons.line_weight)
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(10.6)),
               new Container(

                 alignment: Alignment.center,
                 child: new RaisedButton(
                     onPressed: calculate,
                 color: Colors.pinkAccent,
                 child: new Text('calculate'),
                   textColor: Colors.white,

               ),

               )
                ],

              ),

                 ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("$finalResult",
                style: new TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  fontSize: 19.9

                ),),
                new Padding(padding: new EdgeInsets.all(5.0)),
        new Text("$r",
        style: new TextStyle(
          color: Colors.pinkAccent,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
          fontSize: 19.9

        ) ,),],
            )
               ],
            ),
        ),

      );

  }

}