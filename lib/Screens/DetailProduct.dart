import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';

class DetailProduct extends StatefulWidget {
  final String? title;
  final String? prdNo;
  final String? deskripsi;
  final String? stok;
  final String? harga;
  const DetailProduct({
      Key? key, this.title, this.prdNo, this.deskripsi, this.stok, this.harga
  }) : super (key: key);
  @override
  State<StatefulWidget> createState() {
    return DetailProductState();
  }
}

class DetailProductState extends State<DetailProduct>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Detail", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black87),),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(Ionicons.chevron_back_outline, color: Colors.black87,),),
        centerTitle: true,

      ),
      body: Container(
        color: Colors.white,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: 280,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.asset('assets/images/clothes.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child:
                    Material(
                        borderRadius: BorderRadius.circular(20),
                        elevation: 5,
                        child:
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child:
                          IconButton(
                            // ignore: avoid_print
                            onPressed: () => print('Add to cart '),
                            icon: const Icon(Ionicons.bag_add_outline, color: Colors.black87,),
                          ),
                        )
                    )
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                     widget.title.toString(),
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    Text(NumberFormat.simpleCurrency(decimalDigits: 0, name: "Rp", locale: "id_ID").format(double.tryParse('${widget.harga}')),
                      style:const  TextStyle(
                          color: Color(0xff8E8EF6),
                          fontSize: 19.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Center(
                      child: Container(
                        margin: const  EdgeInsets.symmetric(vertical: 16.0),
                        height: 2.0,
                        width: 221.0,
                        color: const  Color(0xffDEDEDE),
                      ),
                    ),
                    Text('Stock : ${widget.stok}'),
                  ],
                ),
              ),
            ),
            // ignore: deprecated_member_use
            FlatButton(
              color: Colors.black87,
              onPressed: () => print('111'),
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: const Center(
                child: Text(
                  "Add To Basket",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}