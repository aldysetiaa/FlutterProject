import 'dart:convert';

List<ProductsModel>
  productsModelFromJson(String str) =>
    List<ProductsModel>.from(
        json.decode(str).map((x) => ProductsModel.fromJson(x)));
//
String productsModelToJson(List<ProductsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModel {
  ProductsModel({
    this.prdNo,
    this.prdNm,
    this.selPrc,
    this.htmlDetail,
    this.dispCtgrNmMid,
    this.dispCtgrNmRoot,
    this.selMthdCd,
    this.stckQty,
    this.selQty,
});


  final String? prdNo;
  final String? prdNm;
  final String? selPrc;
  final String? htmlDetail;
  final String? dispCtgrNmMid;
  final String? dispCtgrNmRoot;
  final String? selMthdCd;
  final String? stckQty;
  final String? selQty;


  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    prdNo: json['prdNo'],
    prdNm: json['prdNm'],
    selPrc: json['selPrc'],
    htmlDetail: json['htmlDetail'],
    dispCtgrNmMid: json['dispCtgrNmid'],
    dispCtgrNmRoot: json['dispCtgrNmRoot'],
    selMthdCd: json['selMthdCd'],
    stckQty: json['stckQty'],
    selQty: json['selQty'],
  );
  //
  Map<String, dynamic> toJson() => {
    "prdNo" : prdNo,
    "prdNm" : prdNm,
    "selPrc" : selPrc,
    "desc" : htmlDetail,
    "dispCtgrNmMid" : dispCtgrNmMid,
    "dispCtgrNmRoot" : dispCtgrNmRoot,
    "selMthdCd" : selMthdCd,
    "stckQty" : stckQty,
    "selQty" : selQty,
  };
}