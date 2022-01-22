// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:crypto_app/pages/homePage.dart';
import 'package:crypto_app/services/apiResponse.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/apiModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<CoinApiModel>>(
      create: (context) {
        return ApiData.apiModel();
      },
      initialData: const [],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: const HomePage(),
      ),
    );
  }
}
