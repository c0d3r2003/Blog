import '../models/admin.dart';
import '../pages/view_posts.dart';

class UserPreferences {
 static User myUser = User(
    imagePath:
    'https://abcdhelloworld.000webhostapp.com/uploads/posts/${posts[0].aimage}',
    name: posts[0].author,
    email: posts[0].aemail,
    about: posts[0].about,
    isDarkMode: false,
  );
}