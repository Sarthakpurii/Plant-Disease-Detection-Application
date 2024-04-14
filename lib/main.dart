import "package:flutter/material.dart";
import "package:plant_disease/screens/home-screen.dart";

final ThemeData purpTheme=ThemeData(
        brightness: Brightness.dark,
          primaryColor: const Color(0xFF140A23),
          buttonTheme: const ButtonThemeData(
            buttonColor: Color(0xFFE42666),
            textTheme: ButtonTextTheme.primary,
          ),
          scaffoldBackgroundColor: const Color(0xFF140A23),
          textTheme: const TextTheme().copyWith(
            bodyMedium: const TextStyle(color: Colors.white),
            bodySmall: const TextStyle(color: Colors.white),
            bodyLarge: const TextStyle(color: Colors.white)
          ),
          // textTheme: const TextTheme(
          //   displayLarge: TextStyle(color: Color(0xFFBE3144)),
          //   bodyLarge: TextStyle(color: Color.fromARGB(255, 240, 95, 73)),
          //   // bodyMedium: TextStyle(color: Color(0xFFF05941)),
          //   bodyMedium: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          //   bodySmall: TextStyle(color: Color.fromARGB(255, 240, 95, 73)),
            
          // ),
          iconTheme: const IconThemeData(
            color: Colors.white,
            // color: Color(0xFFBE3144),
          ),
          appBarTheme:const AppBarTheme(
            color: Color(0xFF140A23),
            elevation: 0,
            foregroundColor: Colors.white,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color(0xFF8D5C94),
            selectedItemColor: Color(0xFFE42666),
            unselectedItemColor: Colors.white
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color(0xFFE42666),
          ),
        );

void main(){
  runApp(MaterialApp(
    theme: purpTheme,
    home: const HomeScreen(),
  ));
}