class ApiConstants {
  static const String baseUrl = '10.0.2.2:8000';
  static const String register = '/api/auth/student/register';
  static const String login = '/api/auth/student/login';
  static const String authorization =
      'Bearer 13|IQTFhZBRZTBv477XNg0iUzg3Pz5WY5ahWTPPKdFK7b58fbac';
  static const String grades = '/api/grades';
  static const String centers = '/api/centers';
  static const String verify = '/api/auth/email/verify';
  static const String redeemCode = '/api/codes/redeem';
  static const String getProfile = '/api/auth/profile';
  static const String getLessons = '/api/lessons';
  static const String buyLesson = '/api/lessons/buy';
  static const String favoriteLessons='/api/favorites';
  static const String boughtLessons='/api/lessons/my-lessons';
  static const String googleSignIn="/api/auth/student/social-login";
}
