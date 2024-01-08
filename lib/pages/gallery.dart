import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'view_posts.dart';


class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Browse",
          style: TextStyle(
            color: Colors.transparent,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            decoration: TextDecoration.underline,
            decorationColor: Colors.black,
            decorationThickness: 2,
            shadows: [Shadow(color: Colors.black, offset: Offset(0, -5))],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network('https://abcdhelloworld.000webhostapp.com/uploads/posts/${posts[index].image}',
                    fit: BoxFit.cover,
                  ),
                ),

              ],
            );
          },
        ),
      ),
    );
  }
}
