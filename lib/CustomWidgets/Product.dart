import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import '../Models/ProductModel.dart';
import '../Screens/DetailProduct.dart';
import 'package:get/get.dart';
class ProductTile extends StatelessWidget {
  final ProductsModel product;
  // ignore: use_key_in_widget_constructors
  const ProductTile(this.product);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: () => Get.to(() => DetailProduct(title: '${product.prdNm}',prdNo: '${product.prdNo}', harga: '${product.selPrc}', stok: '${product.stckQty}', deskripsi: '${product.htmlDetail}',),),
      child: Card(
        color: Colors.grey[150],
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.asset('assets/images/clothes.jpg',
                    fit: BoxFit.cover,
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
                        onPressed: () => print('Add to cart ${product.prdNm}'),
                        icon: const Icon(Ionicons.bag_add_outline, color: Colors.black87,),
                      ),
                    )
                )
                ),
              ],
            ),
            const SizedBox(height: 8),
        Align(
          alignment: Alignment.topLeft,
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.prdNm!,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 15,
                    fontWeight: FontWeight.w600, color: Colors.black87),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(NumberFormat.simpleCurrency(decimalDigits: 0, name: "Rp", locale: "id_ID").format(double.tryParse('${product.selPrc}')),
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black54)),
            ],
          )
        ),
        ],
      )
      ),
      ),
    );
  }
}
