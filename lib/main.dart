import 'package:flutter/material.dart';
import 'package:meals/core/services/service_locator.dart';
import 'package:meals/presentation/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // 2. أساسية جداً قبل أي async init

  ServiceLocator().init();
  runApp(const MealsReceipe());
}

class MealsReceipe extends StatelessWidget {
  const MealsReceipe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
