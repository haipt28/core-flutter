import 'package:flutter/material.dart';
import 'package:go/services/navigator_key.dart';
import 'package:go/services/storage.dart';
import 'package:go/styles/dark_theme.dart';
import 'package:go/styles/light_theme.dart';

import 'presentation/screen/auth/login.dart';
import 'presentation/screen/home/home.dart';

void main() async {
  final SecureStorage secureStorage = SecureStorage();
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await secureStorage.readSecureData('token');

  runApp(MyApp(token)
      // MultiProvider(
      // providers: providers,
      // child: MyApp(token),
      // ),
      );
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp(this.token, {super.key});

  Widget checkRole() {
    if (token == null) {
      return const LoginScreen();
    }
    return const HomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter init app',
      navigatorKey: navigatorKey,
      routes: <String, WidgetBuilder>{
        '/login': (context) => const LoginScreen(),
      },
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      showSemanticsDebugger: false,
      home: checkRole(),
    );
  }
}
