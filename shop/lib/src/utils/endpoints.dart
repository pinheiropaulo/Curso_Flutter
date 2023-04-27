import 'package:flutter_dotenv/flutter_dotenv.dart';

final _baseUrl = dotenv.env['FIREBASE_URL'];

abstract class Endpoints {
  static final String productUrl = '$_baseUrl/products';
  static final String orderUrl = '$_baseUrl/orders';
}
