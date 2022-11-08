import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:untitled8/model/model.dart';

import '../const.dart';
import '../view/home.dart';


class HomeController extends ChangeNotifier {

  HomeController() {
     getData(1);
    getData(2);
    getData(3);
    setUserData();
 notifyListeners();
  }


  List<Model> movieList = [];
  List<Model> movieList2 = [];
  List<Model> movieList3 = [];
 // http://api.themoviedb.org/3/movie/top_rated?api_key=f04342b213d1dcadca727ce7312d3baf&language=en-US&page=$page
  Future<void> getData(int page) async {
    Dio client = Dio();
    String url = "http://api.themoviedb.org/3/movie/top_rated?api_key=$api_key&language=en-US&page=$page";
    var response = await client.get(url);
    if (response.statusCode == 200) {
      for (var i in response.data["results"]) {
        if(page==1){
          movieList.add(Model.fromJson(i));
        }
        if(page==2){
          movieList2.add(Model.fromJson(i));
        }
        if(page==3){
          movieList3.add(Model.fromJson(i));
        }
      }
    }
    notifyListeners();
  }




//https://api.themoviedb.org/3/movie/372058/videos?api_key=f04342b213d1dcadca727ce7312d3baf&language=en-US

Future<String>getKey(int id)async{
    Dio client =Dio();
    String url = "https://api.themoviedb.org/3/movie/$id/videos?api_key=f04342b213d1dcadca727ce7312d3baf&language=en-US";
    var response = await client.get(url);
    print("${await response.data["results"][0]["key"]},,,,,,,,,,,,,,,");
    notifyListeners();
    return  response.data["results"][0]["key"];

}
  String email="";
  String password="";
  var formKey=GlobalKey<FormState>();
  Future<void>setUserData()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.setString("email", email);
    preferences.setString("password", password);
    notifyListeners();
  }

  Future<void>getUserData(context)async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    String? data=preferences.getString("email");
    if(data!=null||data!=""){
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context)=>HomeScreen()
      ));
    }
    notifyListeners();

  }
  Future<void>removeUserFromPrefs()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.clear();
    notifyListeners();

  }

  }




//http://api.themoviedb.org/3/movie/top_rated?api_key=f04342b213d1dcadca727ce7312d3baf&language=en-US&page=2
//"https://api.themoviedb.org/3/movie/278/videos?api_key=f04342b213d1dcadca727ce7312d3baf&language=en-US";