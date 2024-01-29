import 'package:dev_azuma/flutter_rest_api/models/yugioh_card.dart';

import '../../x_experiment/flutter_lifecycle.dart';
import '../models/post.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var respond = await client.get(uri);
    if (respond.statusCode == 200) {
      var json = respond.body;
      return postsFromJson(json);
    }
    return null;
  }

  Future<YuGiOh?> getYuGiOh() async {
    var client = http.Client();

    var uri = Uri.parse('https://db.ygoprodeck.com/api/v7/cardinfo.php');
    var respond = await client.get(uri);
    if (respond.statusCode == 200) {
      var json = respond.body;
      xPrint(json);
      return yuGiOhFromJson(json);
    }
    xPrint(respond.statusCode);
    return null;
  }
}
