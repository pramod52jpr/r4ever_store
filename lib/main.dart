import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r4everstore/bloc/auth_bloc/auth_bloc.dart';
import 'package:r4everstore/bloc/holiday_bloc/holiday_bloc.dart';
import 'package:r4everstore/bloc/membership_bloc/membership_bloc.dart';
import 'package:r4everstore/bloc/profile_bloc/profile_bloc.dart';
import 'package:r4everstore/bloc/task_bloc/task_bloc.dart';
import 'package:r4everstore/data/repository/auth_repo.dart';
import 'package:r4everstore/data/repository/holiday_repo.dart';
import 'package:r4everstore/data/repository/membership_repo.dart';
import 'package:r4everstore/data/repository/profile_repo.dart';
import 'package:r4everstore/data/repository/task_repo.dart';
import 'package:r4everstore/data/routes/route.dart';
import 'package:r4everstore/data/routes/routes_name.dart';
import 'package:r4everstore/utils/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthBloc(authRepo: AuthRepo())),
          BlocProvider(create: (context) => ProfileBloc(profileRepo: ProfileRepo())),
          BlocProvider(create: (context) => TaskBloc(taskRepo: TaskRepo())),
          BlocProvider(create: (context) => HolidayBloc(holidayRepo: HolidayRepo())),
          BlocProvider(create: (context) => MembershipBloc(membershipRepo: MembershipRepo())),
        ],
        child: MaterialApp(
          title: 'R4EVER STORE',
          theme: ThemeData(
            fontFamily: "Nunito",
            colorSchemeSeed: K.primaryColor
          ),
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(
                  physics: const BouncingScrollPhysics()
              ),
              child: child!,
            );
          },
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.generateRoute,
          initialRoute: RoutesName.splashScreen,
        ),
    );
  }
}
