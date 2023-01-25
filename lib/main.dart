import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/modules/update_item.dart';
import 'package:todo_app/providers/providersetting.dart';
import 'package:todo_app/providers/todoprovider.dart';
import 'package:todo_app/shared/styles/my_theme.dart';
import 'layout/home_layout.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseFirestore.instance.settings =
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  await FirebaseFirestore.instance.disableNetwork();


  SettingProvider.prefs = await SharedPreferences.getInstance();
  runApp(MultiProvider(
    providers: [
         ChangeNotifierProvider(create:(BuildContext context)=> TodoProvider()..fetchtodosFromfirestore()),
         ChangeNotifierProvider(create:(BuildContext context)=> SettingProvider()..gettheme()),
    ],
  child: EasyLocalization(supportedLocales: [
    Locale("en",),
    Locale("ar","EG"),
  ],
      startLocale: Locale("en",),
  saveLocale: true,
  path: 'assets/translations',
  fallbackLocale:  Locale("en",),
  child: MyApp()
  ),
  ),
  );
}

class MyApp extends StatelessWidget {

  late SettingProvider providermode;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    providermode = Provider.of(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      routes: {
        Home_layout.routeName : (context) => Home_layout(),
        UpdateItem.updateitem : (context) => UpdateItem(),
      },

      initialRoute: Home_layout.routeName,
      theme: MyTheme.LightTheme,
      darkTheme: MyTheme.DarkTheme,
      themeMode: providermode.cuurrenttheme,
    );
  }
}
