import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:pokerina/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokerina/pokemon_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var PokeApi =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  late List pokedex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -50,
            right: -50,
            child: Image.asset(
              'images/pokeball.png',
              width: 200,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: Text("Pokerina",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          Positioned(
            top: 150,
            bottom: 0,
            width: width,
            child: Column(
              children: [
                pokedex != null
                    ? Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.4,
                          ),
                          itemCount: pokedex.length,
                          itemBuilder: (context, index) {
                            var type = pokedex[index]['type'][0];
                            return InkWell(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 12.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: pokedex[index]['type'][0] == "Grass"
                                        ? Colors.greenAccent
                                        : pokedex[index]['type'][0] == "Fire"
                                            ? Colors.redAccent
                                            : pokedex[index]['type'][0] ==
                                                    "Water"
                                                ? Colors.blue
                                                : pokedex[index]['type'][0] ==
                                                        "Poison"
                                                    ? Colors.deepPurpleAccent
                                                    : pokedex[index]['type']
                                                                [0] ==
                                                            "Electric"
                                                        ? Colors.amber
                                                        : pokedex[index]['type']
                                                                    [0] ==
                                                                "Rock"
                                                            ? Colors.grey
                                                            : pokedex[index]['type']
                                                                        [0] ==
                                                                    "Ground"
                                                                ? Colors.brown
                                                                : pokedex[index]['type']
                                                                            [
                                                                            0] ==
                                                                        "Psychic"
                                                                    ? Colors
                                                                        .indigo
                                                                    : pokedex[index]['type'][0] ==
                                                                            "Fighting"
                                                                        ? Colors
                                                                            .orange
                                                                        : pokedex[index]['type'][0] ==
                                                                                "Bug"
                                                                            ? Colors.lightGreenAccent
                                                                            : pokedex[index]['type'][0] == "Ghost"
                                                                                ? Colors.deepPurple
                                                                                : pokedex[index]['type'][0] == "Normal"
                                                                                    ? Colors.black26
                                                                                    : Colors.pink,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          bottom: -10,
                                          right: -10,
                                          child: Image.asset(
                                              'images/pokeball.png',
                                              height: 100,
                                              fit: BoxFit.fitHeight)),
                                      Positioned(
                                          top: 30,
                                          left: 20,
                                          child: Text(
                                            pokedex[index]['name'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.white),
                                          )),
                                      Positioned(
                                        bottom: 5,
                                        right: 5,
                                        child: CachedNetworkImage(
                                          imageUrl: pokedex[index]['img'],
                                          height: 100,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                      Positioned(
                                        top: 70,
                                        left: 20,
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0,
                                                right: 8.0,
                                                top: 4,
                                                bottom: 4),
                                            child: Text(
                                              type.toString(),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            color: Colors.black26,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (__) => PokemonDetailScreen(
                                              pokemonDetail: pokedex[index],
                                              color: pokedex[index]['type']
                                                          [0] ==
                                                      "Grass"
                                                  ? Colors.greenAccent
                                                  : pokedex[index]['type'][0] ==
                                                          "Fire"
                                                      ? Colors.redAccent
                                                      : pokedex[index]['type']
                                                                  [0] ==
                                                              "Water"
                                                          ? Colors.blue
                                                          : pokedex[index]['type']
                                                                      [0] ==
                                                                  "Poison"
                                                              ? Colors
                                                                  .deepPurpleAccent
                                                              : pokedex[index]['type']
                                                                          [0] ==
                                                                      "Electric"
                                                                  ? Colors.amber
                                                                  : pokedex[index]['type'][0] ==
                                                                          "Rock"
                                                                      ? Colors
                                                                          .grey
                                                                      : pokedex[index]['type'][0] ==
                                                                              "Ground"
                                                                          ? Colors
                                                                              .brown
                                                                          : pokedex[index]['type'][0] == "Psychic"
                                                                              ? Colors.indigo
                                                                              : pokedex[index]['type'][0] == "Fighting"
                                                                                  ? Colors.orange
                                                                                  : pokedex[index]['type'][0] == "Bug"
                                                                                      ? Colors.lightGreenAccent
                                                                                      : pokedex[index]['type'][0] == "Ghost"
                                                                                          ? Colors.deepPurple
                                                                                          : pokedex[index]['type'][0] == "Normal"
                                                                                              ? Colors.white70
                                                                                              : Colors.pink,
                                              heroTag: index,
                                            )));
                                //navigation
                              },
                            );
                          },
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void fetchPokemonData() {
    var url = Uri.https('raw.githubusercontent.com',
        '/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodedJsonData = jsonDecode(value.body);
        pokedex = decodedJsonData['pokemon'];
        print(pokedex[1]['name']);
        setState(() {});
      }
    });
  }
}
