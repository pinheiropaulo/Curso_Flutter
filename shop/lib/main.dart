import 'package:flutter/material.dart';
import 'package:shop/my_app.dart';
import 'package:shop/src/utils/env/env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.instance.load();

  runApp(const MyApp());
}
