import 'package:bayrak_quiz_uygulamasi/QuizEkrani.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:Colors.blueAccent ,
        title: Text("Anasayfa"),
      ),
      body:
      Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("QUİZE HOŞGELDİNİZ",style: TextStyle(color:Colors.blueAccent,fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(
              width: 200,
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizEkrani()));

                  },
                  child: Text("Başla",style: TextStyle(color:Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),),
            ),

          ],
        ),
      ),

    );
  }
}
