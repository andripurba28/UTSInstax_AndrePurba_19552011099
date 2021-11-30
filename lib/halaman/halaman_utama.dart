import 'package:flutter/material.dart';
import 'package:utsinstax_andrepurba_19552011099/halaman/detailPage.dart';
class HalamanUtama extends StatefulWidget {
  HalamanUtama({Key? key}) : super(key: key);

  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
 List<ModelCard> data=[];
 List<ModelCard> modelseacrhing=[];

 @override
  void initState() {
    // TODO: implement initState
    data = [
      ModelCard(
          nama: "Mint",
          warna: Color(0xff70b1a1),
          harga: "20.99",
          image: 'assets/InstaxMini7plus_Mint_R.png'),
      ModelCard(
          nama: "Choral",
          warna: Color(0xffb0463c),
          harga: "30.99",
          image: 'assets/InstaxMini7plus_Choral_R.png'),
      ModelCard(
          nama: "Blue",
          warna: Color(0xff77a0c6),
          harga: "45.99",
          image: 'assets/InstaxMini7plus_Blue_R.png'),   
      ModelCard(
          nama: "Pink",
          warna: Color(0xffcf9496),
          harga: "50.99",
          image: 'assets/InstaxMini7plus_Pink_R.png'),
      ModelCard(
          nama: "Lavender",
          warna: Color(0xff855f8c),
          harga: "55.99",
          image: 'assets/InstaxMini7plus_Lavender_R.png'),
      
    ];

    modelseacrhing = data;
    super.initState();
  }
  @override
   Widget cardCamera(ModelCard model){
     return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailPage(
                        model: model,
                      )),
            );
          },
          child: Container(
            height: 150,
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            margin: new EdgeInsets.only(right: 30.0, top: 12),
            decoration: BoxDecoration(
              color: model.warna,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Limited Edition', style: TextStyle(color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'Instax ',
                      style: TextStyle(color: Colors.white),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Mini " + model.nama + " 7+",
                            style: TextStyle(fontWeight: FontWeight.w800)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: RichText(
                    text: TextSpan(
                      text: '\$ ',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      children: <TextSpan>[
                        TextSpan(
                            text: model.harga,
                            style: TextStyle(fontWeight: FontWeight.w900)),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(model: model)),
                    );
                  },
                  child: Text(
                    'Buy',
                    style: TextStyle(color: model.warna),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // <-- Radius
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
            margin: new EdgeInsets.fromLTRB(0, 35, 0, 0),
            alignment: FractionalOffset.centerRight,
            child: Image.asset(model.image, height: 100)),
      ],
    );
  }
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Center(child: Image.asset('assets/fujifilm-banner.png', height: 20)),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_bag),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                style: TextStyle(color: Colors.white),
                onChanged: (text) {
                  text = text.toLowerCase();
                  setState(() {
                    data = modelseacrhing.where((val) {
                      var cariNama = val.nama.toLowerCase();
                      return cariNama.contains(text);
                    }).toList();
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: "Search",
                    fillColor: Colors.black),
              ),
               ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return cardCamera(
                    data[index],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
class ModelCard {
  ModelCard({
    required this.nama,
    required this.warna,
    required this.harga,
    required this.image,
  });

  String nama;
  Color warna;
  String harga;
  String image;

  factory ModelCard.fromJson(Map<String, dynamic> json) => ModelCard(
        nama: json["nama"],
        warna: json["warna"],
        harga: json["harga"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "warna": warna,
        "harga": harga,
        "image": image,
      };
}