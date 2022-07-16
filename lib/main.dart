import 'package:flutter/material.dart';
import '../../../bindings/package_binding.dart';
import '../../../bindings/view_model_binding.dart';
import 'screens/home_screen/home_screen.dart';
import 'screens/welcome_screen/welcome_screen.dart';

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
        ChangeNotifierProvider(create: (context) => CovidViewModel()),
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
                ? const HomeScreen()
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
