import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart'; // 1.Import provider package
import 'package:todo_app/pages/add_page.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/provider/todo_provider.dart'; // Import TodoProvider

void main() {
  runApp(ChangeNotifierProvider(
      //1. Wrap MyApp with ChangeNotifierProvider
      create: (context) => TodoProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/add',
        builder: (context, state) => AddPage(),
      ),
    ],
  );
}
