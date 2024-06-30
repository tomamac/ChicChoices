import 'package:chic_choices/features/authentication/models/user_model.dart';
import 'package:chic_choices/features/authentication/repository/authentication_repository/authentication_repository.dart';
import 'package:chic_choices/features/authentication/repository/user_repository/user_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("ขัดข้อง", "กรุณาล็อคอินเพื่อทำรายการ");
    }
  }

  Future<List<UserModel>> getAllUser() async {
    return await _userRepo.allUser();
  }

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}
