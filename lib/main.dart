import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokerina/entrar.dart';
import 'package:pokerina/home_screen.dart';

void main() {
  runApp(Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ('POKERINA'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Entrar(
        title: 'POKERINA',
      ),
    );
  }
}
