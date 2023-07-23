import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
//check if required to add super key
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'BMI Calculator',
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State <MyHomePage>{

  String finalBMI = ' ';
  String status = ' ';
  late double bmi; 

  final userHeight = TextEditingController();
  final userWeight = TextEditingController();

  getCalculation(double height, double weight) async{

    bmi = weight / (height * height);  
    finalBMI = bmi.toStringAsFixed(2); 

    if(bmi < 18.5)
    status = 'Underweight';
    if(18.5 <= bmi && bmi <= 24.9)
    status = 'Healthy Weight';
    if(bmi >= 25 && bmi <= 29.9)
    status = 'Overweight';
    if(bmi >= 30)
    status = 'Obese';

  }
  
  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Height (m)', style: TextStyle(color:Color.fromARGB(255, 74, 74, 74), fontSize: 15)),
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                controller: userHeight,
                decoration: InputDecoration(
                  hintText: ' ex. 1.6'
                )),
              const Text('Weight (kg)', style: TextStyle(color:Color.fromARGB(255, 74, 74, 74), fontSize: 15)),
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                controller: userWeight,
                decoration: InputDecoration(
                  hintText: ' ex. 80'
                )),
            ],
          ),
          SizedBox(height:25),
          FloatingActionButton.extended(
                onPressed:() {
                  setState(() {
                    getCalculation(
                    double.parse(userHeight.text),
                    double.parse(userWeight.text));
                  });
                },
                label: Text('Calculate'),
                icon: Icon(Icons.calculate),),
          SizedBox(height:25),
          RichText(
            text: TextSpan(
              text: 'BMI: ',
              style: TextStyle(color: Colors.black, fontSize: 20),
              children: <TextSpan> [
                TextSpan(
                  text: '$finalBMI',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )
              ]
            ),),
            RichText(
            text: TextSpan(
              text: 'Status: ',
              style: TextStyle(color: Colors.black, fontSize: 20),
              children: <TextSpan> [
                TextSpan(
                  text: '$status',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )
              ]
            ),)
        ]),
      ),
    )
  );

}
