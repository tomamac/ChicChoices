import 'package:chic_choices/features/authentication/pages/loginPage.dart';
import 'package:chic_choices/features/authentication/repository/exceptions/login_email_password_failure.dart';
import 'package:chic_choices/features/authentication/repository/exceptions/signup_email_password_failure.dart';
import 'package:chic_choices/features/core/pages/bottomPageSelector.dart';
import 'package:chic_choices/states/core/mainpage_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? (
            Get.offAll(
              () => const loginPage(),
            ),
          )
        : (
            Get.offAll(
              () => bottomPageSelector(),
              binding: BindingsBuilder.put(
                () => MainPageState(),
              ),
            ),
          );
  }

  //Functions
  void phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('ขัดข้อง',
              'เบอร์โทรศัพท์ที่กรอกไม่ถูกต้อง(ใส่ +66 แทน 0 ตัวแรก)');
        } else {
          Get.snackbar('ขัดข้อง', 'Unknown');
        }
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
        Get.snackbar('สำเร็จ', 'ส่งรหัส OTP ไปที่ $phoneNo');
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: this.verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  Future<String?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => bottomPageSelector())
          : Get.back();
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      return ex.message;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }

  Future<String?> LoginWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = LogInWithEmailAndPasswordFailure.code(e.code);
      return ex.message;
    } catch (_) {
      const ex = LogInWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }

  Future<void> logout() async => await _auth.signOut();
}
