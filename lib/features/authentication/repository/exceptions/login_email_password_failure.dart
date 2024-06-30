class LogInWithEmailAndPasswordFailure {
  final String message;

  const LogInWithEmailAndPasswordFailure(
      [this.message = "ระบบขัดข้อง กรุณาลองใหม่อีกครั้ง"]);

  factory LogInWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure('พาสเวิร์ดไม่ถูกต้อง');
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure('อีเมลที่กรอกไม่ถูกต้อง');
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
            'ไม่พบผู้ใช้ กรุณากด "ลืมรหัสผ่าน" หากลืมรหัสผ่าน');
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
            'บัญชีถูกจำกัดการใช้งาน กรุณาติดต่อผู้ให้บริการ');
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }
}
