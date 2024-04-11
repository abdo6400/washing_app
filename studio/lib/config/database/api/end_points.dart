class EndPoints {
  //basic urls
  static const String baseUrl =
      '********************'; //192.168.0.103:3000
  static const String prefixToken = 'Bearer';
  static const String images =
      "**************************";
  //authentiaction
  static const String studios = "studios";
  static const String login = '$studios/login';
  static const String forgetPassword = '$studios/forget-password';
  static const String register = '$studios/register';
  static const String resetPassword = '$studios/reset-password';
  static const String resendCode = '$studios/resend-code';
  static const String checkEmail = '$studios/check-email';
  static const String verifyEmail = '$studios/verify-email';
  static const String getCurrentStudio = "$studios/current-studio";
  static const String services = "services";
}

class ApiKeys {
  static const String email = "email";
  static const String password = "password";
  static const String rePassword = "rePassword";
  static const String newPassword = 'newPassword';
  static const String oldPassword = 'oldPassword';
  static const String confirmPassword = 'confirmPassword';
  static const String message = "message";
  static const String token = "token";
  static const String name = "name";
  static const String phone = "phone";
  static const String image = "image";
  static const String age = "age";
  static const String coordinates = "coordinates";
  static const String location = "location";
  static const String otpSecret = "otpSecret";
}
