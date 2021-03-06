import 'bloc/blocs/redirection_to_measurements_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'bloc/blocs/latest_measurements_bloc.dart';
import 'package:river_water_level/bloc/blocs/alert_measurements_bloc.dart';
import 'package:river_water_level/controllers/rivers_state_controller.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          Provider(create: (_) => AlertMeasurementsBloc()),
          Provider(create: (_) => LatestMeasurementsBloc()),
          Provider(create: (_) => RedirectionToMeasurementsBloc()),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xfff0f7ff);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      title: "Rivers water level",
      theme: ThemeData(primaryColor: primaryColor),
      debugShowCheckedModeBanner: false,
      home: const RiversStateController(),
    );
  }
}
