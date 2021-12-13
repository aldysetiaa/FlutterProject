import 'dart:convert';

List<DetailModel>
detailModelFromJson(String str) =>
    List<DetailModel>.from(
        json.decode(str).map((x) => DetailModel.fromJson(Map<String, dynamic>.from(x)))).toList();

String detailModelToJson(List<DetailModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class DetailModel {
  DetailModel({
    this.prdNo,
    this.prdNm
  });


  final String? prdNo;
  final String? prdNm;



  factory DetailModel.fromJson(Map<String, dynamic> json) =>
      DetailModel(
        prdNo: json['prdNo'],
        prdNm: json['prdNm'],

      );

  Map<String, dynamic> toJson() => {
    "prdNo" : prdNo,
    "prdNm" : prdNm,

  };

}