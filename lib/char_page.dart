import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ricknmorty/char_model.dart';
import 'package:ricknmorty/char_repository.dart';

class CharPage extends StatefulWidget {
  const CharPage({Key? key}) : super(key: key);

  @override
  State<CharPage> createState() => _CharPageState();
}

class _CharPageState extends State<CharPage> {
  CharRepository repository = CharRepository(dio: Dio());
  late Future<List<CharModel>> characters;

  @override
  void initState() {
    characters = repository.getAllCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        body: FutureBuilder(
          future: characters,
          builder: (context, AsyncSnapshot<List<CharModel>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          CharModel myChar = snapshot.data![index];
                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black, blurRadius: 5)
                                    ],
                                    color: Color.fromARGB(
                                        255,
                                        Random().nextInt(1000),
                                        Random().nextInt(1000),
                                        Random().nextInt(1000)),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                myChar.image,
                                                scale: 3,
                                              )),
                                              shape: BoxShape.circle),
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                    'genero : ${myChar.gender}'),
                                              ],
                                            ),
                                            Text('especie : ${myChar.species}'),
                                            Text(
                                                'planet origin : ${myChar.originPlanet}'),
                                            Text('status : ${myChar.status} '),
                                            Text('if ${myChar.id}'),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          );
                        }),
                  );
                }
              case ConnectionState.waiting:
                {
                  return const CircularProgressIndicator();
                }

              default:
                {
                  return const CircularProgressIndicator();
                }
            }
          },
        ));
  }
}
