
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled8/controller/home_controller.dart';
import 'package:untitled8/view/details_screen.dart';

import '../const.dart';
import '../widget/custom_text.dart';
import '../widget/list_of_items.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController providet = Provider.of<HomeController>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: CustomText(
          txt: "Movies",
          isBold: true,
        ),
        centerTitle: true,

      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  txt: "Top 10",
                  isBold: true,
                ),
                carouselSlider(height, providet, width),
                SizedBox(
                  height: height * .26,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (context, i) => InkWell(
                        onTap: ()async{
                          alertDialog(context);
                          var id=await providet.getKey(providet.movieList2[i].id);
                          print(id);
                          print(";;;;;;;;;");
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                          DetailsScreen(
                            id:id,
                            name: providet.movieList2[i].title.toString(),
                            overView: providet.movieList2[i].overview,
                            imagePath:"https://www.themoviedb.org/t/p/w600_and_h900_bestv2${providet.movieList2[i].poster_path}" ,
                          ),

                          ));
                        },
                        child: ListItems(
                            height: height,
                            width: width,
                            imagePath:
                                "https://www.themoviedb.org/t/p/w600_and_h900_bestv2${providet.movieList2[i].poster_path}",
                            title: providet.movieList2[i].title.toString() ,
                        ),
                      ),
                  ),
                ),
                SizedBox(
                  height: height * .26,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (context, i) => InkWell(
                        onTap: ()async{
                          alertDialog(context);
                          String key=await providet.getKey(providet.movieList3[i].id).toString();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                              DetailsScreen(
                                id: key,
                                name: providet.movieList3[i].title.toString(),
                                overView: providet.movieList3[i].overview,
                                imagePath:"https://www.themoviedb.org/t/p/w600_and_h900_bestv2${providet.movieList3[i].poster_path}" ,
                              ),

                         ));
                        },
                        child: ListItems(
                            height: height,
                            width: width,
                            imagePath:
                                "https://www.themoviedb.org/t/p/w600_and_h900_bestv2${providet.movieList3[i].poster_path}",
                            title: providet.movieList3[i].title.toString() ,
                        ),
                      ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> alertDialog(BuildContext context) {
    return showDialog(
                    barrierDismissible: false,
                      context: context, builder:(context)=>AlertDialog(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      CircularProgressIndicator(),
                      Text("Loading.....")
                    ],),
                  ));
  }

  Widget carouselSlider(double height, HomeController providet, double width) {
    return SizedBox(
      height: height * .35,
      width: double.infinity,
      child: CarouselSlider.builder(
          itemCount: providet.movieList.length,
          itemBuilder: (context, i, realIndex) => InkWell(
            onTap: ()async{
              alertDialog(context);
              var id=await providet.getKey(providet.movieList[i].id);
              print(";;;;;;;;;;;;;;;;;;;;");
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                  DetailsScreen(
                    id: id,
                    name: providet.movieList[i].title.toString(),
                    overView: providet.movieList[i].overview,
                    imagePath:"https://www.themoviedb.org/t/p/w600_and_h900_bestv2${providet.movieList[i].poster_path}" ,
                  ),

              ));
            },
            child: Container(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          child: CustomText(
                            txt: providet.movieList[i].vote_average.toString(),
                            textAlign: TextAlign.center,
                            isBold: true,
                          ),
                          width: width * .2,
                          height: height * .05,
                          decoration: BoxDecoration(
                              color: primaryColor.withOpacity(.7),
                              borderRadius: BorderRadiusDirectional.only(
                                bottomStart: Radius.circular(10),
                                topEnd: Radius.circular(10),
                              )),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          child: CustomText(
                            fontSize: 18,
                            txt: providet.movieList[i].title.toString(),
                          ),
                          width: width * .36,
                          height: height * .08,
                          decoration: BoxDecoration(
                              color: primaryColor.withOpacity(.7),
                              borderRadius: BorderRadiusDirectional.only(
                                bottomStart: Radius.circular(10),
                                topEnd: Radius.circular(10),
                              )),
                        ),
                      ),
                    ],
                  ),
                  margin: EdgeInsetsDirectional.only(
                      start: 10, end: 10, top: 20, bottom: 10),
                  height: height * .3,
                  width: width * .7,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadiusDirectional.circular(12),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://www.themoviedb.org/t/p/w600_and_h900_bestv2${providet.movieList[i].poster_path}"))),
                ),
          ),
          options: CarouselOptions(
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2))),
    );
  }
}

