import'package:flutter/material.dart';
import '../pages/view_posts.dart';
class ImageSlider {
  final int? id;
  final String imgUrl;
  final String title;

  ImageSlider({this.id, required this.imgUrl, required this.title});
}
List<ImageSlider> imageSliderList = [];
void callImages(){
for(int i = 0 ; i<posts.length; i++){

imageSliderList.add(ImageSlider(imgUrl: 'https://abcdhelloworld.000webhostapp.com/uploads/posts/${posts[i].image}', title: posts[i].category));

}

}