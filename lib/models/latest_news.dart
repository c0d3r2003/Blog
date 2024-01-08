import'package:flutter/material.dart';
import '../pages/view_posts.dart';

class LatestNews {
  final String imgUrl;
  final String category;
  final String title;
  final String author;
  final String aimage;
  final String content;
  final String date;

  LatestNews(
      {required this.imgUrl,
      required this.category,
      required this.title,
      required this.author,
      required this.aimage,
      required this.content,
      required this.date
      });
}

List<LatestNews> latestNewsList = [];

void updateNews() {
  for (int i = 0; i < posts.length; i++) {
    latestNewsList.add(LatestNews(
        imgUrl: 'https://abcdhelloworld.000webhostapp.com/uploads/posts/${posts[i].image}',
        category: posts[i].category,
        title: posts[i].title,
        author: posts[i].author,
        aimage: posts[i].aimage,
        content: """${posts[i].description}\n ${posts[i].description}""",
        date: posts[i].date
    ));
  }
}
