import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/screens/home_screen/home_screen.dart';
import 'package:vaccine/screens/welcome_screen/welcome_screen.dart';
import 'package:vaccine/view_model/account_view_model.dart';
import 'package:vaccine/view_model/auth_view_model.dart';
import 'package:vaccine/view_model/booking_view_model.dart';
import 'package:vaccine/view_model/family_view_mode.dart';

void main() {
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
        ChangeNotifierProxyProvider<AuthViewModel, AccoutnViewModel>(
          create: (context) => AccoutnViewModel(),
          update: (context, auth, datas) =>
              datas!..updateData(auth.userId, auth.userFamily),
        ),
        ChangeNotifierProxyProvider<AuthViewModel, FamilyViewModel>(
          create: (context) => FamilyViewModel(),
          update: (context, auth, datas) =>
              datas!..updateData(auth.userId, auth.userFamily),
        ),
        ChangeNotifierProvider(create: (context) => BookingViewModel()),
      ],
      builder: (context, child) => Consumer<AuthViewModel>(
        builder: (context, auth, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'VaksinQu',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: GoogleFonts.poppinsTextTheme(),
            ),
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

                      return WelcomeScreen();
                    },
                  )),
      ),
    );
  }
}
