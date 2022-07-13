import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/components/loading.dart';
import 'package:vaccine/models/family.dart';
import 'package:vaccine/screens/home_screen/home_screen.dart';
import 'package:vaccine/screens/welcome_screen/welcome_screen.dart';
import 'package:vaccine/view_model/account_view_model.dart';
import 'package:vaccine/view_model/auth_view_model.dart';
import 'package:vaccine/view_model/family_view_model.dart';
import 'package:vaccine/view_model/hospital_view_model.dart';
import 'package:vaccine/view_model/news_view_model.dart';
import 'package:vaccine/view_model/ticket_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(create: (context) => NewsViewModel()),
        ChangeNotifierProxyProvider<AuthViewModel, AccoutnViewModel>(
          create: (context) => AccoutnViewModel(),
          update: (context, auth, datas) => datas!..updateData(auth.parentId),
        ),
        ChangeNotifierProxyProvider<AuthViewModel, FamilyViewModel>(
          create: (context) => FamilyViewModel(),
          update: (context, auth, datas) => datas!..updateData(auth.parentId),
        ),
        ChangeNotifierProxyProvider<AuthViewModel, HospitalViewModel>(
          create: (context) => HospitalViewModel(),
          update: (context, auth, datas) => datas!..updateData(auth.parentId),
        ),
        ChangeNotifierProxyProvider<AuthViewModel, TicketViewModel>(
          create: (context) => TicketViewModel(),
          update: (context, auth, datas) => datas!..updateData(auth.parentId),
        ),
      ],
      builder: (context, child) => Consumer<AuthViewModel>(
        builder: (context, auth, child) => MaterialApp(
            /*   useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder, */
            theme: ThemeData(scaffoldBackgroundColor: Colors.white),
            debugShowCheckedModeBanner: false,
            title: 'VaksinQu',
            home: auth.isAuth
                ? HomeScreen()
                : FutureBuilder(
                    future: auth.autoLogin(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Scaffold(
                          body: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      return const WelcomeScreen();
                    },
                  )),
      ),
    );
  }
}
