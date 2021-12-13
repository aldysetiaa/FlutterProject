import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/ProductModel.dart';
import 'global.dart';


class ConnectionHttp {
  static Future<List<ProductsModel>> getProductsXML() async {
    var xml =
    await http.get(Uri.parse(URL+"rest/prodservices/product/listing?page=1"),
        headers: {
          "Content-type" : "application/xml",
          "Accept-Charset" : "utf-8",
          "openapikey" : APIKEY,
        });

      xml2Json.parse(xml.body);
      var res = xml2Json.toParker();
      var data = json.decode(res);
      var xx = json.encode(data['Products']['product']);
      return productsModelFromJson(xx);
  }


}
