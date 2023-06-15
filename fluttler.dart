import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Basit ToDo Uygulaması",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo Uygulaması"),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController(); // TextField'ın kontrolcüsü
  List<String> alisverisListesi = []; // Alışveriş listesini tutan liste

  void elemanEkle() {
    setState(() {
      alisverisListesi.add(t1.text); // Giriş yapılan öğeyi listeye ekler
      t1.clear(); // TextField'ı temizler
    });
  }

  void elemanCikar(String element) { // Belirtilen öğeyi listeden çıkarır
    setState(() {
      alisverisListesi.remove(element);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: alisverisListesi.length,
              itemBuilder: (context, siraNumarasi) => ListTile(
                subtitle: Text("Marketten Alınacaklar"), // Liste öğesinin alt başlığı
                title: Text(alisverisListesi[siraNumarasi]), // Liste öğesinin başlığı
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle), // Öğeyi listeden çıkaran düğme
                  onPressed: () {
                    elemanCikar(alisverisListesi[siraNumarasi]); // Öğeyi çıkarmak için ilgili metodu çağırır
                  },
                ),
              ),
            ),
          ),
          TextField(
            controller: t1, // TextField'ı kontrol etmek için kullanılan kontrolcü
          ),
          RaisedButton(
            onPressed: elemanEkle, // Ekle düğmesine basıldığında ilgili metodu çağırır
            child: Text("Ekle"),
          ),
        ],
      ),
    );
  }
}