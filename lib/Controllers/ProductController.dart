import 'package:get/get.dart';
import '../Configs/ConnectionHttp.dart';

class ProductController extends GetxController {
 var isLoading     = true.obs;
 var productList   = [].obs;
 List<String>  CtgrChoice = ['Men Clothing', 'Moslem Fashion', 'Handphone Accessories','Books','Mens Bags','Men Pants'];


  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  void getProduct() async {
    try {
      isLoading(true);
      var products = await ConnectionHttp.getProductsXML();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}