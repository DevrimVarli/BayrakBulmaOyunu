import 'dart:collection';

import 'package:bayrak_quiz_uygulamasi/Bayraklardao.dart';
import 'package:bayrak_quiz_uygulamasi/SonucEkrani.dart';
import 'package:flutter/material.dart';

import 'Bayraklar.dart';

class QuizEkrani extends StatefulWidget {
  const QuizEkrani({super.key});

  @override
  State<QuizEkrani> createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {
  var sorular=<Bayraklar>[];
  var yalnisSecenekler=<Bayraklar>[];
  late Bayraklar dogruSoru;
  var tumSecenekler=HashSet<Bayraklar>();
  int soruSayac=0;
  int dogruSayac=0;
  int yalnisSayac=0;

  String bayrakResimadi="placeholder.png";
  String buttonAyazi="";
  String buttonByazi="";
  String buttonCyazi="";
  String buttonDyazi="";
  @override
  void initState() {

    super.initState();
    sorulariAl();
  }
  Future<void> sorulariAl() async{
    sorular= await Bayraklardao().rastgele5getir();
    sorulariyukle();


  }
  Future<void> sorulariyukle() async{
    dogruSoru=sorular[soruSayac];
    bayrakResimadi=dogruSoru.bayrak_resim;
    yalnisSecenekler=await Bayraklardao().rastgele3getir(dogruSoru.bayrak_id);
    tumSecenekler.clear();
    tumSecenekler.add(dogruSoru);
    tumSecenekler.add(yalnisSecenekler[0]);
    tumSecenekler.add(yalnisSecenekler[1]);
    tumSecenekler.add(yalnisSecenekler[2]);

    buttonAyazi=tumSecenekler.elementAt(0).bayrak_ad;
    buttonByazi=tumSecenekler.elementAt(1).bayrak_ad;
    buttonCyazi=tumSecenekler.elementAt(2).bayrak_ad;
    buttonDyazi=tumSecenekler.elementAt(3).bayrak_ad;
    setState(() {

    });

  }

  void soruSayacKontrol(){
    soruSayac+=1;
    if(soruSayac!=5){
      sorulariyukle();
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SonucEkrani(dogruSayisi: dogruSayac)));
    }

  }
  void dogruKontrol(String buttonYazi){
    if(dogruSoru.bayrak_ad==buttonYazi){
      dogruSayac+=1;
    }
    else{
      yalnisSayac+=1;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Ekrani"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Doğru:$dogruSayac",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.blueAccent),),
                Text("Yanlış:$yalnisSayac",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.blueAccent),),
              ],
            ),
            Text("${soruSayac+1}.Soru",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.blueAccent),),
            SizedBox(
                height: 200,
                width: 300,
                child:Image.asset("resimler/${bayrakResimadi}"), ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onPressed: (){
                  dogruKontrol(buttonAyazi);
                  soruSayacKontrol();


                },
                child: Text(buttonAyazi,style: TextStyle(fontSize: 15,color: Colors.white),),),
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onPressed: (){
                  dogruKontrol(buttonByazi);
                  soruSayacKontrol();

                },
                child: Text(buttonByazi,style: TextStyle(fontSize: 15,color: Colors.white),),),
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onPressed: (){
                  dogruKontrol(buttonCyazi);
                  soruSayacKontrol();

                },
                child: Text(buttonCyazi,style: TextStyle(fontSize: 15,color: Colors.white),),),
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onPressed: (){
                  dogruKontrol(buttonDyazi);
                  soruSayacKontrol();

                },
                child: Text(buttonDyazi,style: TextStyle(fontSize: 15,color: Colors.white),),),
            ),

          ],
        ),
      ),
    );
  }
}
