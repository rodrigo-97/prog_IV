import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prog_IV/provider/users_provider.dart';
import 'package:prog_IV/routes/app_routes.dart';
import 'package:prog_IV/views/user_form.dart';
import 'package:prog_IV/views/user_list.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UsersProvider(),
      child: MaterialApp(
        title: 'Usuários',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM: (_) => UserForm()
        },
      ),
    );
  }
}