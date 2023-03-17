import 'package:bloc_login_demo/core/theme.dart';
import 'package:bloc_login_demo/features/auth/bloc/login/login_bloc.dart';
import 'package:bloc_login_demo/features/auth/bloc/register/register_bloc.dart';
import 'package:bloc_login_demo/features/search/presentation/screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LoginBloc(),
        ),
        BlocProvider(
          create: (_) => RegisterBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Demo',
        theme: themeData(context),
        home: const SearchScreen(),
      ),
    );
  }
}
