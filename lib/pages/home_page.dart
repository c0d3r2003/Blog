import 'package:blogclub/models/latest_news.dart';
import 'package:blogclub/models/slider_image.dart';
import 'package:blogclub/theme.dart';
import 'package:blogclub/widget/latest_news_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'view_posts.dart';


class HomePage extends StatefulWidget {


  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final  String image = "status_photo_2.png";
  bool _load = false; // used to show products list or progress bar

  void update(bool success) {
    setState(() {

      _load = true; // show product list
      if (!success) {
        // API request failed
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('failed to load data')));
      }
    });
  }

  @override
  void initState() {
    // update data when the widget is added to the tree the first tome.
    latestNewsList.clear();
    updateNews();
    updatePosts(update);
    callImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: [
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Hi, Bagus!",
                style: regularTextStyle.copyWith(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 7),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "Explore today's",
            style: blackTextStyle.copyWith(fontSize: 24),
          ),
        ),
        const SizedBox(height: 20),

        const SizedBox(height: 32),
        CarouselSlider(
          items: imageSliderList.map((item) {
            return Stack(
              children: [
                Positioned(
                  left: 20,
                  bottom: 30,
                  child: Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 0, 0, 0),
                          blurRadius: 15,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                    child: Image.network(item.imgUrl,
                      height: 273, width: 236, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 40,
                  left: 20,
                  child: Text(
                    item.title,
                    style: whiteTextStyle.copyWith(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          }).toList(),
          options: CarouselOptions(
            height: 300,
            enlargeCenterPage: true,
            initialPage: 5,
            viewportFraction: 0.7,
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Latest Posts",
                style: blackTextStyle.copyWith(fontSize: 20),
              ),
              Text(
                "",
                style: regularTextStyle.copyWith(
                  fontSize: 14,
                  color: blueColor,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 24),
        Column(
          children: latestNewsList.sublist(0, 3).map((news) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: LatestNewsItem(latestNews: news),
            );
          }).toList(),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
