import 'package:shop/src/utils/env/env.dart';

final _baseUrl = Env.instance.get('FIREBASE_URL');
final _firebaseKey = Env.instance.get('FIREBASE_KEY');

abstract class Endpoints {
  static final String productUrl = '$_baseUrl/products';
  static final String orderUrl = '$_baseUrl/orders';
  static final String userFavorites = '$_baseUrl/userFavorites';
}

abstract class AuthEndpoints {
  static final String signUp =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseKey';

  static final String signInWithPassword =
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseKey';
}
