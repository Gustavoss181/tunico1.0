import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tunico/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FirebaseAppInit());
}

class FirebaseAppInit extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        if (snapshot.hasError) {
          return Container(
            child: Center(
              child: Text('Ocorreu um erro ao iniciar o Firebase'),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        return Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop List App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: LoginPage(),
      initialRoute: AppRoutes.LOGIN,
      routes: AppRoutes.routes,
    );
  }
}