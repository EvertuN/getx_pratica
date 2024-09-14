import 'package:dio/dio.dart';
import 'package:getx_pratica/app/data/models/githubuserModel.dart';

class GitHubRepository {
  final Dio dio;

  GitHubRepository({required this.dio});

  Future<List<GithubUserModel>> getGithubUsers() async {
    final result = await dio.get('https://api.github.com/users');

    final List<GithubUserModel> users = [];

    if (result.statusCode == 200) {
      result.data
          .map((item) => users.add(GithubUserModel.fromMap(item)))
          .toList();
    }

    return users;
  }
}
