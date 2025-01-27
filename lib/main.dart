
import 'package:flutter/material.dart';
import 'package:myapp/auth/login_or_register.dart';
import 'package:myapp/models/restaurant.dart';
import 'package:myapp/themes/theme_provider.dart';
import 'package:provider/provider.dart';
// Corrected login_page path

void main() {
    WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(providers: [
      // theme provider
      ChangeNotifierProvider(create: (context) => ThemeProvider(),),

      // restaurant provider
      ChangeNotifierProvider(create: (context) => Restaurant(),),
    ],
    child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    ); // MaterialApp
  }
}
