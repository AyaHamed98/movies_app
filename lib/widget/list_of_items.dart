import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class ListItems extends StatelessWidget {
  ListItems(
      {required this.height,
        required this.width,
        required this.imagePath,
        required this.title});

  double height;
  double width;
  String imagePath;
  String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * .1,
      width: width * .35,
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          children: [
            Container(
              height: height * .2,
              width: width * .28,
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      imagePath,
                    ),
                  )),
            ),
            CustomText(maxLines: 1, overflow: TextOverflow.ellipsis, txt: title),
          ],
        ),
      ),
    );
  }
}
class ListOfItems extends StatelessWidget {
  ListOfItems({Key? key,required this.onTap,required this.height ,required this.width,required this.title,required this.imagePath}) : super(key: key);
  double height;
  double width;
  String imagePath;
  String title;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: SizedBox(
          height: height * .26,
          child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (context, i) =>
          SizedBox(
            height: height * .1,
            width: width * .4,
            child: Column(
              children: [
                Container(
                  height: height * .2,
                  width: width * .27,
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          imagePath,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(maxLines: 1, overflow: TextOverflow.ellipsis, txt: title,fontSize: 15,),
                ),
              ],
            ),
          )
      )),
    );
  }
}
