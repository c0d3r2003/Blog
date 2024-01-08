// import 'dart:convert' as convert;
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// // main URL for REST pages
// const String _baseURL = 'abcdhelloworld.000webhostapp.com';
//
// class Post {
// int id;
// String title;
// String description;
// String image;
// int categoryid;
//
//   Post(this.id, this.title, this.description, this.image, this.categoryid);
//
//   @override
//   String toString() {
//     return 'Post{_pid: $id, _title: $title, _description: $description, _image: $image, _category_id: $categoryid}';
//   }
// }
// String car = 'hello';
// const List<Post> posts = [];
//
// // asynchronously update _products list
// void updateProducts(Function(bool success) update) async {
//   try {
//     final url = Uri.https(_baseURL, 'flutter_posts.php');
//     final response = await http
//         .get(url)
//         .timeout(const Duration(seconds: 10)); // max timeout 5 seconds
//     posts.clear(); // clear old products
//     if (response.statusCode == 200) {
//       // if successful call
//       final jsonResponse = convert
//           .jsonDecode(response.body); // create dart json object from json array
//       for (var row in jsonResponse) {
//         // iterate over all rows in the json array
//         Post p = Post(
//           // create a product object from JSON row object
//             int.parse(row['id']),
//             row['name'],
//             row['description'],
//             row['image'],
//             int.parse(row['category_id']));
//         posts.add(p); // add the product object to the _products list
//       }
//       update(
//           true); // callback update method to inform that we completed retrieving data
//     }
//   } catch (e) {
//     update(false); // inform through callback that we failed to get data
//   }
// }
import 'dart:convert' as convert;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// main URL for REST pages
const String _baseURL = 'abcdhelloworld.000webhostapp.com';

class Post {
  int id;
  String title;
  String description;
  String image;
  String category;
  String author;
  String aimage;
  String aemail;
  String about;
  int category_id;
  String date;

  Post(this.id, this.title, this.description, this.image, this.category, this.author, this.aimage, this.aemail, this.about, this.category_id, this.date);

  @override
  String toString() {
    return 'Post{pid: $id, title: $title, description: $description, image: $image, category: $category, author: $author}';
  }
}

List<Post> posts = [];
int categories = 0;

// asynchronously update _products list
void updatePosts(Function(bool success) update) async {
  try {
    final url = Uri.https(_baseURL, 'flutter_posts.php');
    final response = await http
        .get(url)
        .timeout(const Duration(seconds: 10)); // max timeout 5 seconds
    posts.clear(); // clear old products
    if (response.statusCode == 200) {
      // if successful call
      final jsonResponse = convert
          .jsonDecode(response.body); // create dart json object from json array

      for (var row in jsonResponse) {
        // iterate over all rows in the json array
        Post p = Post(
          // create a product object from JSON row object
            int.parse(row['id']),
            row['name'],
            row['description'],
            row['image'],
            row['cname'],
            row['aname'],
            row['aimage'],
            row['aemail'],
            row['about'],
            int.parse(row['category_id']),
            row['created_at']
        );
        categories = max(categories, int.parse(row['category_id']));
        posts.add(p); // add the product object to the _products list
      }


      update(
          true); // callback update method to inform that we completed retrieving data
    }
  } catch (e) {
    update(false); // inform through callback that we failed to get data
  }
}
