import 'package:flutter/material.dart';
import 'package:flutter_pets_app/services/services.dart';
import 'package:flutter_pets_app/Screens/cell.dart';

class SubBreedScreen extends StatefulWidget {
  //var
  static const String routeName = "/SubBreed";
  const SubBreedScreen({super.key});

  @override
  State<SubBreedScreen> createState() => _SubBreedScreenState();
}

class _SubBreedScreenState extends State<SubBreedScreen> {
  @override
  Widget build(BuildContext context) {
    var breed = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(breed.substring(0, 1).toUpperCase() + breed.substring(1)),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            //1 Sub breeds
            const Text(
              "Sub Breeds",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
                future: DogService().getSubBreeds(breed),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isNotEmpty) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Cell(breed, snapshot.data![index],
                                CellType.subbreed);
                          });
                    } else {
                      return  Center(
                        child: Column(
                          children: [
                            //No available data title
                            const Text("No Sub-Breeds"),
                            //Generate random image
                            TextButton(
                              onPressed: () {
                                showDialog(
              context: context,
              builder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Image
                    FutureBuilder(
                        future:
                            DogService().getRandomImageByBreed(breed, ""),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Image.network(snapshot.data!);
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  ],
                );
              });
                              },
                              child: const Text(
                                "Generate random by breed",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            const SizedBox(
              height: 10,
            ),
            //2 Gallery
            const Text(
              "Gallery",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
                future: DogService().getGalleryByBreed(breed),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Image.network(snapshot.data![index]);
                        });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
          ],
        ),
      )),
    );
  }
}
