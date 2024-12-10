import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
  int dogruSayisi;

  SonucEkrani({required this.dogruSayisi});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuc Ekrani"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("${widget.dogruSayisi} Doğru",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.blueAccent),),
                Text("${5-widget.dogruSayisi} Yanlış",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.blueAccent),),

              ],
            ),
            Text("%${(widget.dogruSayisi)*100/5} Başarı",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.pink),),
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
                 Navigator.pop(context);

                },
                child: Text("Tekrar Dene",style: TextStyle(fontSize: 15,color: Colors.white),),),
            ),
          ],
        ),
      ),
    );
  }
}
