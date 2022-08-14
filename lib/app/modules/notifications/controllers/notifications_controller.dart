import 'package:dio/dio.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  RxList<dynamic> users = RxList<dynamic>();
  RxBool isUsersLoading = RxBool(false);
  Future getDummyUsers() async {
    isUsersLoading.value = true;
    Dio dio = Dio();
    var respone = await dio.get('https://dummyapi.io/data/v1/user?limit=10',
        options: Options(
          headers: {'app-id': '6290c3d756b9534b8611bde6'},
          responseType: ResponseType.json,
        ));
    print(respone.data['data']);
    isUsersLoading.value = false;
    final _users = respone.data['data'];
    users(_users);
  }

  @override
  void onInit() {
    super.onInit();
    getDummyUsers();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
