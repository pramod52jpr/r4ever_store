import 'package:flutter/material.dart';
import 'package:r4everstore/bloc/auth_bloc/auth_bloc.dart';
import 'package:r4everstore/data/repository/auth_repo.dart';
import 'package:r4everstore/data/routes/routes_name.dart';
import 'package:r4everstore/ui/admin/add_task_screen.dart';
import 'package:r4everstore/ui/admin/admin_all_tasks.dart';
import 'package:r4everstore/ui/auth/forgot_pass_screen.dart';
import 'package:r4everstore/ui/auth/login_screen.dart';
import 'package:r4everstore/ui/auth/register_screen.dart';
import 'package:r4everstore/ui/home/homebar.dart';
import 'package:r4everstore/ui/profile_screens/admin_panel.dart';
import 'package:r4everstore/ui/profile_screens/wallet_pages/bank_details_screen.dart';
import 'package:r4everstore/ui/profile_screens/my_profile.dart';
import 'package:r4everstore/ui/profile_screens/wallet_screen.dart';
import 'package:r4everstore/ui/splash_screen.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.splashScreen :
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutesName.registerScreen :
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case RoutesName.loginScreen :
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RoutesName.forgotPassScreen :
        return MaterialPageRoute(builder: (context) => const ForgotPassScreen());
      case RoutesName.homeBar :
        return MaterialPageRoute(builder: (context) => const HomeBar());
      case RoutesName.myProfile :
        return MaterialPageRoute(builder: (context) => const MyProfile());
      case RoutesName.bankDetailsScreen :
        return MaterialPageRoute(builder: (context) => BankDetailsScreen(authBloc: AuthBloc(authRepo: AuthRepo())));
      case RoutesName.adminPanel :
        return MaterialPageRoute(builder: (context) => const AdminPanelScreen());
      case RoutesName.adminAllTasks :
        return MaterialPageRoute(builder: (context) => const AdminAllTasks());
      case RoutesName.addTaskScreen :
        return MaterialPageRoute(builder: (context) => const AddTaskScreen());
      case RoutesName.walletScreen :
        return MaterialPageRoute(builder: (context) => const WalletScreen());
      default :
        return MaterialPageRoute(builder: (context) {
        return const Scaffold(
          body: Center(
            child: Text("No route found"),
          ),
        );
      },
      );
    }
  }
}