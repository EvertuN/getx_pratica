import 'package:get/get.dart';
import 'package:getx_pratica/app/data/models/githubuserModel.dart';
import 'package:getx_pratica/app/data/repositories/githubRepository.dart';

class HomeController extends GetxController{
  final GitHubRepository repository;

  final List<GithubUserModel> _users = <GithubUserModel>[].obs;
  List<GithubUserModel> get users => _users;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  HomeController({required this.repository});

  getGithubUsers() async {
    _isLoading.value = true;

    final response = await repository.getGithubUsers();

    _users.addAll(response);

    _isLoading.value = false;
  }
}