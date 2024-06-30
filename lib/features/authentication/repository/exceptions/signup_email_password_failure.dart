class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An Unknown error occured."]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            'กรุณากรอกพาสเวิร์ดขั้นต่ำ 6 ตัวอักษร');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure('กรอกอีเมลไม่ถูกต้อง');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            'อีเมลที่กรอกถูกใช้งานแล้ว');
      case 'Operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
            'ระบบไม่อนุญาต กรุณาติดต่อผู้ให้บริการ');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
            'บัญชีผู้ใช้ถูกจำกัด กรุณาติดต่อผู้ให้บริการ');
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
