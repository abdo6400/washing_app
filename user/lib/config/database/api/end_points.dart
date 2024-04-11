class EndPoints {
  //basic urls
  static const String baseUrl =
      '**********************'; //192.168.0.103:3000
  static const String prefixToken = 'Bearer';
  static const String images =
      "************************";
  //authentiaction
  static const String users = "users";
  static const String login = '$users/login';
  static const String forgetPassword = '$users/forget-password';
  static const String register = '$users/register';
  static const String resetPassword = '$users/reset-password';
  static const String resendCode = '$users/resend-code';
  static const String checkEmail = '$users/check-email';
  static const String verifyEmail = '$users/verify-email';
  static const String carTypes = "cars";
  // profile
  static const String user = "$users/current-user";
  static const String favorites = "$users/favorites";
  //studio
  static const String studios = "studios";
  static const String getStudios = "$studios/get-studios";
  static const String popularStudios = "$studios/popular-studios";
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
