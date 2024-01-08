import 'package:blogclub/models/latest_news.dart';
import 'package:blogclub/pages/detail_news.dart';
import 'package:blogclub/theme.dart';
import 'package:flutter/material.dart';
import '../../pages/view_posts.dart';

class LatestNewsItem extends StatefulWidget {
  final LatestNews latestNews;

  const LatestNewsItem({Key? key, required this.latestNews}) : super(key: key);

  @override
  State<LatestNewsItem> createState() => _LatestNewsItemState();
}

class _LatestNewsItemState extends State<LatestNewsItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailNews(news: widget.latestNews)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            Image.network(
              widget.latestNews.imgUrl,
              width: 92,
              height: 110,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.latestNews.category,
                    style: blackTextStyle.copyWith(fontSize: 14, color: blueColor),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.latestNews.title,
                    style:
                        regularTextStyle.copyWith(fontSize: 14, color: blackColor),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
