import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rsprofile/presentation/pages/home_page.dart';

import '/logics/blocs/repo_cubit.dart';
import '/mytheme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

const kOffWhiteColor = Color(0xFFE0E0E0);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RepoCubit>(
      create: (ctx) => RepoCubit(),
      child: MaterialApp(
        title: 'rsProfile',
        themeMode: ThemeMode.dark,
        darkTheme: MyTheme.theme,
        home: MyHomePage(),
      ),
    );
  }
}
