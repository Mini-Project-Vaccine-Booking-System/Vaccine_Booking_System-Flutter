import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/components/loading.dart';
import 'package:vaccine/screens/home_screen/home_screen.dart';
import 'package:vaccine/screens/welcome_screen/welcome_screen.dart';
import 'package:vaccine/view_model/account_view_model.dart';
import 'package:vaccine/view_model/auth_view_model.dart';
import 'package:vaccine/view_model/family_view_model.dart';
import 'package:vaccine/view_model/hospital_view_model.dart';
import 'package:vaccine/view_model/news_view_model.dart';
import 'package:vaccine/view_model/ticket_view_model.dart';

void main() {
  runApp(const MyApp()
      /* DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(), // Wrap your app
    ), */
      );
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
          update: (context, auth, datas) =>
              datas!..updateData(auth.parentId, auth.token),
        ),
        ChangeNotifierProxyProvider<AuthViewModel, FamilyViewModel>(
          create: (context) => FamilyViewModel(),
          update: (context, auth, datas) =>
              datas!..updateData(auth.parentId, auth.token),
        ),
        ChangeNotifierProxyProvider<AuthViewModel, HospitalViewModel>(
          create: (context) => HospitalViewModel(),
          update: (context, auth, datas) =>
              datas!..updateData(auth.parentId, auth.token),
        ),
        ChangeNotifierProxyProvider<AuthViewModel, TicketViewModel>(
          create: (context) => TicketViewModel(),
          update: (context, auth, datas) =>
              datas!..updateData(auth.parentId, auth.token),
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
                    future: auth.autoLogin().then(
                          (value) => Provider.of<AccoutnViewModel>(context,
                                  listen: false)
                              .inisialData(),
                        ),
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
