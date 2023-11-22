import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName => ".env";
  //NASA
  static String get apodUrl => dotenv.env['APOD_URL'] ?? '';
  static String get apiKey => dotenv.env['API_KEY'] ?? '';
  //INSTAGRAM
  static String get instagramUrl => dotenv.env['INSTAGRAM_URL'] ?? '';
  static String get clientId => dotenv.env['CLIENT_ID'] ?? '';
  static String get clientSecret => dotenv.env['CLIENT_SECRET'] ?? '';
  static String get grantType => dotenv.env['GRANT_TYPE'] ?? '';
  static String get instagramApiVersion =>
      dotenv.env['INSTAGRAM_API_VERSION'] ?? '';
}
