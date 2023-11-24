import 'dart:convert';

import 'package:appviagem/model/data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class DataServices {
  String baseUrl = "http://mark.bslmeiyu.com/api";
  String firebaseUrl = "https://v1.nocodeapi.com/cesar/fbsdk/yJziBHvogIxhKbIV/firestore/allDocuments?collectionName=appviagem";
  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/getplaces';
    
    http.Response res = await http.get(Uri.parse(baseUrl+apiUrl));
    try {
      if(res.statusCode == 200){
        List<dynamic> list = json.decode(res.body);
        print(list);

        Stream<List<DataModel>> list2 = FirebaseFirestore.instance.collection('appviagem').snapshots().map((snapshot) => snapshot.docs.map((doc) => DataModel.fromJson(doc.data())).toList());

        return list.map((e) => DataModel.fromJson(e)).toList();
      }else{
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}

class DataServicesFirebase {
  String baseUrl = "http://mark.bslmeiyu.com/api";
  String firebaseUrl = "https://v1.nocodeapi.com/cesar/fbsdk/yJziBHvogIxhKbIV/firestore/allDocuments?collectionName=appviagem";
  Future<List<DataModel>> getInfo() async {
    http.Response res = await http.get(Uri.parse(firebaseUrl));
    try {
      if(res.statusCode == 200){
        List<dynamic> list = json.decode(res.body);
        print("-----------list-----------");
        print(list);
  
        return list.map((e) => DataModel.fromJson(e)).toList();
      }else{
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}