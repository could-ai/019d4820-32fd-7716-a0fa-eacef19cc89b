import 'package:flutter/material.dart';
import 'developers_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'G-Hunt Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4A85F6), // Синий цвет из макета
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto', // Стандартный шрифт для веб-интерфейсов
      ),
      initialRoute: '/',
      routes: {
        // Сразу показываем дашборд разработчиков как главную страницу
        '/': (context) => const DevelopersScreen(),
      },
    );
  }
}
